Return-Path: <Matt.Redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 2/6] MIPS: tlb-r4k: If there are wired entries, don't use TLBINVF
Date: Tue, 20 Sep 2016 09:47:25 +0100
Message-ID: <1474361249-31064-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org, Matt Redfearn <matt.redfearn@imgtec.com>, Hugh Dickins <hughd@google.com>, Huacai Chen <chenhc@lemote.com>, "David S. Miller" <davem@davemloft.net>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
List-ID: <linux-remoteproc@vger.kernel.org>

When adding a wired entry to the TLB via add_wired_entry, the tlb is
flushed with local_flush_tlb_all, which on CPUs with TLBINV results in
the new wired entry being flushed again.

Behavior of the TLBINV instruction applies to all applicable TLB entries
and is unaffected by the setting of the Wired register. Therefore if
the TLB has any wired entries, fall back to iterating over the entries
rather than blasting them all using TLBINVF.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v2: None

 arch/mips/mm/tlb-r4k.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index e8b335c16295..4953c1a8cdfd 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -67,8 +67,11 @@ void local_flush_tlb_all(void)
 
 	entry = read_c0_wired();
 
-	/* Blast 'em all away. */
-	if (cpu_has_tlbinv) {
+	/*
+	 * Blast 'em all away.
+	 * If there are any wired entries, fall back to iterating
+	 */
+	if (cpu_has_tlbinv && !entry) {
 		if (current_cpu_data.tlbsizevtlb) {
 			write_c0_index(0);
 			mtc0_tlbw_hazard();
-- 
2.7.4
