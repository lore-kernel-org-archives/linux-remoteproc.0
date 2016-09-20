Return-Path: <ralf@linux-mips.org>
Date: Tue, 20 Sep 2016 15:19:35 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH v2 6/6] MIPS: Deprecate VPE Loader
Message-ID: <20160920131934.GE14137@linux-mips.org>
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
 <1474361249-31064-7-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474361249-31064-7-git-send-email-matt.redfearn@imgtec.com>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Sep 20, 2016 at 09:47:29AM +0100, Matt Redfearn wrote:

> The MIPS remote processor driver (CONFIG_MIPS_RPROC) provides a more
> standard mechanism for using one or more VPs as coprocessors running
> separate firmware.
> 
> Here we deprecate this mechanism before it is removed.

The world will be a better place once this is removed.

I receive the occasional minor cleanup or robopatch (coccinelle or similar)
for the VPE loader but I have no indication this is actually being used
by anybody, so is thee any reason why not to delete it right away?

  Ralf
