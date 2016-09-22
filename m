Return-Path: <ralf@linux-mips.org>
Date: Thu, 22 Sep 2016 14:11:37 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH v2 2/6] MIPS: tlb-r4k: If there are wired entries, don't
 use TLBINVF
Message-ID: <20160922121136.GA12981@linux-mips.org>
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
 <1474361249-31064-3-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474361249-31064-3-git-send-email-matt.redfearn@imgtec.com>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>, Huacai Chen <chenhc@lemote.com>, "David S. Miller" <davem@davemloft.net>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Sep 20, 2016 at 09:47:25AM +0100, Matt Redfearn wrote:

> When adding a wired entry to the TLB via add_wired_entry, the tlb is
> flushed with local_flush_tlb_all, which on CPUs with TLBINV results in
> the new wired entry being flushed again.
> 
> Behavior of the TLBINV instruction applies to all applicable TLB entries
> and is unaffected by the setting of the Wired register. Therefore if
> the TLB has any wired entries, fall back to iterating over the entries
> rather than blasting them all using TLBINVF.
> 
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

Queued for 4.9..

  Ralf
