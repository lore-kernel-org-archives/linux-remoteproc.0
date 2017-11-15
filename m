Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 14 Nov 2017 23:23:51 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: Fix error handling paths in order to
 avoid memory leaks
Message-ID: <20171115072351.GC22677@builder>
References: <20171115065835.14525-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115065835.14525-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 14 Nov 22:58 PST 2017, Christophe JAILLET wrote:

> In case of error returned by 'q6v5_xfer_mem_ownership', we must free
> some resources before returning.
> 
> In 'q6v5_mpss_init_image()', add a new label to undo a previous
> 'dma_alloc_attrs()'.
> In 'q6v5_mpss_load()', re-use the already existing error handling code to
> undo a previous 'request_firmware()', as already done in the other error
> handling paths of the function.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks!

Regards,
Bjorn
