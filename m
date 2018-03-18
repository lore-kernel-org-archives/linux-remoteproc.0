Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 18 Mar 2018 15:44:31 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] remoteproc: imx_rproc: Improve 'imx_rproc_probe()'
Message-ID: <20180318224431.GB5626@tuxbook-pro>
References: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 14 Mar 12:56 PDT 2018, Christophe JAILLET wrote:

> Patch 1 fixes a bug.
> Patches 2 and 3 are just clean-ups.
> 

All three patches applied.

Thanks,
Bjorn

> Christophe JAILLET (3):
>   remoteproc: imx_rproc: Fix an error handling path in
>     'imx_rproc_probe()'
>   remoteproc: imx_rproc: Re-use existing error handling path in
>     'imx_rproc_probe()'
>   remoteproc: imx_rproc: Slightly simplify code in 'imx_rproc_probe()'
> 
>  drivers/remoteproc/imx_rproc.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> -- 
> 2.14.1
> 
