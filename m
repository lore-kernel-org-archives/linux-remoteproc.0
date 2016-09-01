Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 1 Sep 2016 08:09:53 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 06/19] remoteproc: core: Add explicit message error if
 cached table failed
Message-ID: <20160901070953.GB4921@dell>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-7-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472676622-32533-7-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, Loic Pallardy <loic.pallardy@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 31 Aug 2016, Loic Pallardy wrote:

> In rproc_fw_boot, add error message if kmemdump failed
> as done for other errors.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@wanadoo.fr>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 96bc8c644..3282a4e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1139,8 +1139,10 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	 * cached_table will be copied into device memory.
>  	 */
>  	rproc->cached_table = kmemdup(table, tablesz, GFP_KERNEL);
> -	if (!rproc->cached_table)
> +	if (!rproc->cached_table) {
> +		dev_err(dev, "Failed to create cached table\n");

This is an OOM error message, which are not allowed upstream.

I believe if kmemdup() fails, the OOM handler will inform the user.

>  		goto clean_up;
> +	}
>  
>  	rproc->table_ptr = rproc->cached_table;
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
