Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 6 Sep 2016 11:10:07 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/3] remoteproc: Modify FW_RSC_ADDR_ANY definition
Message-ID: <20160906181007.GC15161@tuxbot>
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
 <1473147584-13183-2-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473147584-13183-2-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 06 Sep 00:39 PDT 2016, Loic Pallardy wrote:

> Replace 0xFFFFFFFFFFFFFFFF by -1 to fit any type.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

Applied, thanks

> ---
>  include/linux/remoteproc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index d488f9e..80e1cba 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -118,7 +118,7 @@ enum fw_resource_type {
>  	RSC_LAST	= 4,
>  };
>  
> -#define FW_RSC_ADDR_ANY (0xFFFFFFFFFFFFFFFF)
> +#define FW_RSC_ADDR_ANY (-1)
>  
>  /**
>   * struct fw_rsc_carveout - physically contiguous memory request
> -- 
> 1.9.1
> 
