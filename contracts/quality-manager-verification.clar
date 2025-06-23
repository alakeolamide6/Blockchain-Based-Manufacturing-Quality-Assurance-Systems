;; Quality Manager Verification Contract
;; Manages the verification and registration of quality managers

(define-map quality-managers principal {
    name: (string-ascii 50),
    certification: (string-ascii 100),
    verified: bool,
    registered-at: uint
})

(define-map manager-permissions principal {
    can-inspect: bool,
    can-approve: bool,
    can-audit: bool
})

(define-data-var contract-owner principal tx-sender)

;; Error constants
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-MANAGER-NOT-FOUND (err u101))
(define-constant ERR-ALREADY-REGISTERED (err u102))

;; Register a new quality manager
(define-public (register-manager (manager principal) (name (string-ascii 50)) (certification (string-ascii 100)))
    (begin
        (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-NOT-AUTHORIZED)
        (asserts! (is-none (map-get? quality-managers manager)) ERR-ALREADY-REGISTERED)
        (map-set quality-managers manager {
            name: name,
            certification: certification,
            verified: false,
            registered-at: block-height
        })
        (ok true)
    )
)

;; Verify a quality manager
(define-public (verify-manager (manager principal))
    (begin
        (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-NOT-AUTHORIZED)
        (asserts! (is-some (map-get? quality-managers manager)) ERR-MANAGER-NOT-FOUND)
        (map-set quality-managers manager
            (merge (unwrap-panic (map-get? quality-managers manager)) {verified: true}))
        (map-set manager-permissions manager {
            can-inspect: true,
            can-approve: true,
            can-audit: true
        })
        (ok true)
    )
)

;; Check if manager is verified
(define-read-only (is-verified-manager (manager principal))
    (match (map-get? quality-managers manager)
        manager-data (get verified manager-data)
        false
    )
)

;; Get manager details
(define-read-only (get-manager-details (manager principal))
    (map-get? quality-managers manager)
)

;; Get manager permissions
(define-read-only (get-manager-permissions (manager principal))
    (map-get? manager-permissions manager)
)
