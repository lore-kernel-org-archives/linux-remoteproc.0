Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Nov 2018 22:27:14 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: fix kernel-doc comment for parse_fw
Message-ID: <20181108062714.GZ12063@builder>
References: <1541585914-27095-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541585914-27095-1-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 07 Nov 02:18 PST 2018, Fabien Dessenne wrote:

> Fix the kernel-doc comment for "parse_fw" and fix a typo.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Thanks Fabien, applied for v4.21

Regards,
Bjorn

> ---
>  include/linux/remoteproc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e3c5d85..3c83d0f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -332,9 +332,9 @@ struct firmware;
>   * @stop:	power off the device
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> - * @load_rsc_table:	load resource table from firmware image
> + * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @find_loaded_rsc_table: find the loaded resouce table
> - * @load:		load firmeware to memory, where the remote processor
> + * @load:		load firmware to memory, where the remote processor
>   *			expects to find it
>   * @sanity_check:	sanity check the fw image
>   * @get_boot_addr:	get boot address to entry point specified in firmware
> -- 
> 2.7.4
> 
