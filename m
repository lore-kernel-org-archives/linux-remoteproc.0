Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 7 Apr 2016 17:43:43 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC] remoteproc: support ELF loading without resource table
Message-ID: <20160408004343.GI391@tuxbot>
References: <1459996344-2228-1-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459996344-2228-1-git-send-email-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 06 Apr 19:32 PDT 2016, Stefan Agner wrote:

> Start remote processor even if the ELF does not provide a resource
> table.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Hi Bjorn,
> 
> Nice meeting you at ELC!

You too, thanks for the good chat.

> I had this patch carrying in one of my tree
> which basically enables to boot a bare ELF file... Altough my goal
> is it to use firmwares with some kind of resource table, I think we
> should not enforce having a resource table...
> 

I agree, we should support platforms without resource tables; and the
variants of no resource-table in the ELF and no loaded resource table
(transfered to the remote).

> --
> Stefan
> 
>  drivers/remoteproc/remoteproc_core.c | 44 +++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3d7d58a..5e16910 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -799,9 +799,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	struct resource_table *table, *loaded_table;
>  	int ret, tablesz;
>  
> -	if (!rproc->table_ptr)
> -		return -ENOMEM;
> -
>  	ret = rproc_fw_sanity_check(rproc, fw);
>  	if (ret)
>  		return ret;
> @@ -824,21 +821,20 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	/* look for the resource table */
>  	table = rproc_find_rsc_table(rproc, fw, &tablesz);
>  	if (!table) {

We're fetching the resource table here just to verify that the firmware
was not changed since we set up the vrings and whatnot.

So I think it would be more consistent to check for rproc->table_ptr
being set here.

> -		dev_err(dev, "Failed to find resource table\n");
> -		goto clean_up;
> -	}
> -
> -	/* Verify that resource table in loaded fw is unchanged */
> -	if (rproc->table_csum != crc32(0, table, tablesz)) {
> -		dev_err(dev, "resource checksum failed, fw changed?\n");
> -		goto clean_up;
> -	}
> +		dev_info(dev, "No resource table found, continuing...\n");

I think rather than just informing the user (if there even is someone
looking at the dmesg) we should push an "assert" down to the drivers
that require a resource table. But we can make that an incremental patch
(and just be silent for now).

> +	} else {
> +		/* Verify that resource table in loaded fw is unchanged */
> +		if (rproc->table_csum != crc32(0, table, tablesz)) {
> +			dev_err(dev, "resource checksum failed, fw changed?\n");
> +			goto clean_up;
> +		}
>  
> -	/* handle fw resources which are required to boot rproc */
> -	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
> -	if (ret) {
> -		dev_err(dev, "Failed to process resources: %d\n", ret);
> -		goto clean_up;
> +		/* handle fw resources which are required to boot rproc */
> +		ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
> +		if (ret) {
> +			dev_err(dev, "Failed to process resources: %d\n", ret);
> +			goto clean_up;
> +		}

For the Qualcomm case I worked around this by returning a dummy resource
table, see qcom_mdt_find_rsc_table() in
https://patchwork.kernel.org/patch/8681951/

Please update this part and resend a patch and I'll give it some test. I
think we can merge this.

>  	}
>  
>  	/* load the ELF segments to memory */
> @@ -855,13 +851,15 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	 * In order to pass this information to the remote device we must
>  	 * copy this information to device memory.
>  	 */
> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> -	if (!loaded_table) {
> -		ret = -EINVAL;
> -		goto clean_up;
> -	}
> +	if (table) {
> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> +		if (!loaded_table) {
> +			ret = -EINVAL;
> +			goto clean_up;
> +		}
>  
> -	memcpy(loaded_table, rproc->cached_table, tablesz);
> +		memcpy(loaded_table, rproc->cached_table, tablesz);
> +	}

I have a patch available for making the loadable table optional, please
have a look at:
https://patchwork.kernel.org/patch/8681971/

Comments/acks/tested-by appreciated.


Looking at it again I see that I should not assign the table_ptr if we
don't have a loaded table. The table_ptr will be set back to
cached_table upon shutdown, but this is not consistent so I will fix
that in a v3.

Regards,
Bjorn
