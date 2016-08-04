Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 4 Aug 2016 15:00:58 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/9] remoteproc: core: New API to add new resources to
 the resource table
Message-ID: <20160804140058.GB5154@x1>
References: <20160804092153.23032-1-lee.jones@linaro.org>
 <20160804092153.23032-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160804092153.23032-5-lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, loic.pallardy@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 04 Aug 2016, Lee Jones wrote:

> In order to amend or add a new resource table entry we need a method
> for a platform-specific to submit them. rproc_request_resource() is a
> new public API which provides this functionality.
> 
> It is to be called between rproc_alloc() and rproc_add().
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 125 +++++++++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  21 ++++++
>  2 files changed, 146 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 4914482..0abfa2b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -793,6 +793,130 @@ static void rproc_resource_cleanup(struct rproc *rproc)
>  	}
>  }
>  
> +static void rproc_dump_resource_table(struct rproc *rproc,
> +				      struct resource_table *table, int size)
> +{

Ah!  Looks like I mistakenly squashed two patches together.  I won't
re-send, but please treat these two functions as separate patches.  I
will fix this during v2, once I've received some feedback.

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
