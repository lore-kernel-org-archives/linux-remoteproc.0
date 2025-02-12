Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB5B1581F8;
	Wed, 12 Feb 2025 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332491; cv=none; b=sqYPjl5SusednkaZbiNIDIpVApahorBVmz2ZIid439SdVrtPLGHSZENMvxl1eCk0/UEBl0i6iovQxwPS29uA2rB+yiVZotPbOBmYqn+TTjyEfUHwu6Z5a9z6MZR4bGVQOLD7QrROU29yxCvCpX4C5utncqaCHDYA71nKDmP84qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332491; c=relaxed/simple;
	bh=VJU4OkT72njE7nPgWRVMKmpmfirQRoypaDEddTcRczg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDUcMfcH9/s6Xct8/1CVGRO3tzLVh+M9K56oCjzC5TqdaHh5YcGc7kQh9RprIKodegijy0+9r1I5lJuVVt/SCBGbk8BqxnMOdoQ2Z5GGZ1E8yHn43sFrEyTeWg/DVTsjG+IUynHIEiu6Kl4DZfZaZh0XeFFjTzrXh8lJkGwKGpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRatvdZn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRatvdZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AAEC4CEDF;
	Wed, 12 Feb 2025 03:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739332491;
	bh=VJU4OkT72njE7nPgWRVMKmpmfirQRoypaDEddTcRczg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRatvdZn3cto/WRVRJAxJ2oXVJ/VYXWHQqeqaPljqwFV25HSlW6TVVkNJCsZFbhHW
	 /gSv8hp234jBGpDpzMCqLqMwvgCj/oqUO+OB3Wjf/iOu1KZ8F41N7UX/MZIo3LLR+M
	 Zbcw0EKjqnL/G68CXqTFPU2JlXw5zr0atUJH2IZXJW0uYX3K4vtCDM/J7tuwjNhoro
	 areM8JKK1ZR/H59n7jMzeod41skcH/O+ElMkW1wPoGwmsPvqIyGmI3fhFRMc7577zB
	 r4zZC5CFdmEAF1TVV5b+oIqXaTpoLoZBx3bHZ4HQZlMA0vz97SclfsxSMcKPU3LYy5
	 vxBSdjyu5dcGg==
Date: Tue, 11 Feb 2025 21:54:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
Message-ID: <ol4wp4szz2qpyz7viukivpjtvx3urw3yfaae3rzxvfuywrfjmb@aojo6gcc65ww>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com>
 <adqulwb54wvn36mnjq7u23qdiyapadr3ruhqluxab7mg3kowz5@4rexefd5mlwp>
 <a8654e63-ff92-4d11-a3f5-75626e6dc6fe@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8654e63-ff92-4d11-a3f5-75626e6dc6fe@foss.st.com>

On Tue, Dec 10, 2024 at 11:33:31AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 12/10/24 00:14, Bjorn Andersson wrote:
> > On Thu, Nov 28, 2024 at 09:42:10AM GMT, Arnaud Pouliquen wrote:
> >> This patch updates the rproc_ops structures to include two new optional
> >> operations.
> >>
> >> - The load_fw() op is responsible for loading the remote processor
> >> non-ELF firmware image before starting the boot sequence. This ops will
> >> be used, for instance, to call OP-TEE to  authenticate an load the firmware
> >> image before accessing to its resources (a.e the resource table)
> >>
> >> - The release_fw op is responsible for releasing the remote processor
> >> firmware image. For instance to clean memories.
> >> The ops is called in the following cases:
> >>  - An error occurs between the loading of the firmware image and the
> >>    start of the remote processor.
> >>  - after stopping the remote processor.
> >>
> > 
> > Why does this difference need to be encoded in rproc_ops? I think we
> > should strive for having a single, simple high level flow of operations
> > through the remoteproc core for which the specifics of each remoteproc
> > instance can be encoded in that driver.
> > 
> > 
> > Perhaps there's a good reason for this, but if so please read and follow
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > to make that reasoning clear in the commit message.
> > 
> 
> The actual sequence to load a remoteproc firmware is
> - get firmware from file system and store the firmware image in Linux kernel memory

This sounds like "load" in remoteproc terminology.

> - get resource table from the firmware image and make a copy(
> - parse the resource table and handle the resources

> - load the firmware
> - start the firmware

And these two are "start".

> 
> 
> In OP-TEE we support not only one ELF image but n images (for instance a TF-M +
> a zephyr), the segments can be encrypted the OP-TEE load sequence is
>  - copy header and meta data of the signed image in a secure memory
>  - verify it
>  - copy segments in remote processor memory and authenticate segments in place.
>  - optionally decrypt the segments
> 
> Only at this step the resource table as been authenticated (and decrypted)

"this step" meaning TA_RPROC_FW_CMD_LOAD_FW? Above you say that happens
after you parse the resource table.

> 
> So the point is that we need to load the firmware before getting the resource table
> 
> 
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> Update vs version V13:
> >> - Rework the commit to introduce load_fw() op.
> >> - remove rproc_release_fw() call from  rproc_start() as called in
> >>   rproc_boot() and rproc_boot_recovery() in case of error.
> >> - create rproc_load_fw() and rproc_release_fw() internal functions.
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
> >>  drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
> >>  include/linux/remoteproc.h               |  6 ++++++
> >>  3 files changed, 35 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index ace11ea17097..8df4b2c59bb6 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >>  	kfree(rproc->cached_table);
> >>  	rproc->cached_table = NULL;
> >>  	rproc->table_ptr = NULL;
> >> +	rproc_release_fw(rproc);
> >>  unprepare_rproc:
> >>  	/* release HW resources if needed */
> >>  	rproc_unprepare_device(rproc);
> >> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
> >>  		return ret;
> >>  	}
> >>  
> >> +	ret = rproc_load_fw(rproc, firmware_p);
> > 
> > It is not clear to me why in the case of OP-TEE we need to invoke the
> > "load operation" here, and in the case of "legacy" ELF loading we do it
> > first thing in rproc_start() (i.e. on the very next line of code being
> > executed).
> 
> For the OP-TEE, please refer to my comment above.
> 
> The only reason I can see for the legacy ELF is that the resource table could
> contain information to be able to configure some resources to load the firmware.
> In case of OP-TEE this would be managed in OP-TEE.
> 

Sure, but as I say...inline rproc_start() here and the very next
operation we perform is something we call "load".

Why do we need to differentiate "load" and "load firmware", when we call
them at the same step in the sequence?

> > 
> > 
> > Should we start by renaming rproc_load_segments() rproc_load() and move
> > it out of rproc_start()? (I.e. here?)
> > 
> > Perhaps define that rproc_load() is responsible for "loading firmware"
> > (whatever that means) and establishing rproc->cached_table, and
> > rproc->table_ptr?
> > 
> > (Note that this seems like a good cleanup of the spaghetti regardless)
> > 
> 
> It's something that crossed my mind, but I don't know the legacy well enough to
> guarantee that it will work in all drivers.
> 

Looking at this again, if we move it, we need to duplicate it across a
few different call sites. So might need to take another look at that.

Still flatten the code and you seem to do:

if (load_fw)
	load_fw();
if (load)
	load();

Why do we need two different things named "load".

> If you want to go in this direction, perhaps this is something that could be
> addressed in a dedicated pull request? In this case, the ops could become
> load_fw and load_fw_new, similar to how it is done for platform_driver::remove.
> 

No need to make it more complicated than it is, change the symbol name
and fix the 3 places that calls the function.

> 
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	/* boot the remote processor up again */
> >>  	ret = rproc_start(rproc, firmware_p);
> >> +	if (ret)
> >> +		rproc_release_fw(rproc);
> > 
> > The fact that you rproc_release_fw() in the error path here, right
> > before we unconditionally release_firmware() the actual firmware means
> > that you have 2 different life cycles with very very similar names.
> > 
> > This will contain bugs, sooner or later.
> 
> So we need to find a better way for the ops if we continue in this direction.
> What about introducing rproc_load_new and rproc_release?
> 

You need to help me understand why load and load_new are both needed.

And no, "load_new" is not an ok name.

> > 
> >>  
> >>  	release_firmware(firmware_p);
> >>  
> >> @@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
> >>  			goto downref_rproc;
> >>  		}
> >>  
> >> +		ret = rproc_load_fw(rproc, firmware_p);
> >> +		if (ret)
> >> +			goto downref_rproc;
> >> +
> >>  		ret = rproc_fw_boot(rproc, firmware_p);
> >> +		if (ret)
> >> +			rproc_release_fw(rproc);
> >>  
> >>  		release_firmware(firmware_p);
> >>  	}
> >> @@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
> >>  	kfree(rproc->cached_table);
> >>  	rproc->cached_table = NULL;
> >>  	rproc->table_ptr = NULL;
> >> +	rproc_release_fw(rproc);
> >>  out:
> >>  	mutex_unlock(&rproc->lock);
> >>  	return ret;
> >> @@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> >>  	if (!rproc->ops->coredump)
> >>  		rproc->ops->coredump = rproc_coredump;
> >>  
> >> -	if (rproc->ops->load)
> >> +	if (rproc->ops->load || rproc->ops->load_fw)
> >>  		return 0;
> >>  
> >>  	/* Default to ELF loader if no load function is specified */
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 0cd09e67ac14..2104ca449178 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
> >>  	return (val <= (size_t) -1);
> >>  }
> >>  
> >> +static inline void rproc_release_fw(struct rproc *rproc)
> >> +{
> >> +	if (rproc->ops->release_fw)
> >> +		rproc->ops->release_fw(rproc);
> >> +}
> >> +
> >> +static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
> >> +{
> >> +	if (rproc->ops->load_fw)
> >> +		return rproc->ops->load_fw(rproc, fw);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  #endif /* REMOTEPROC_INTERNAL_H */
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index 2e0ddcb2d792..ba6fd560f7ba 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -381,6 +381,10 @@ enum rsc_handling_status {
> >>   * @panic:	optional callback to react to system panic, core will delay
> >>   *		panic at least the returned number of milliseconds
> >>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> >> + * @load_fw:	optional function to load non-ELF firmware image to memory, where the remote
> >> + *		processor expects to find it.
> > 
> > Why does it matter if it's an ELF or not?
> 
> No matter. It was more to differentiate from the legacy one, but it does not
> make sense and adds to the argument that the ops naming is not accurate.
> 

I'm probably misunderstanding your intention here, but I can't help
feeling that you add this code path to avoid understanding or fixing the
existing code.

> > 
> > In the Qualcomm case, firmware comes in ELF format, Linux loads the
> > LOAD segments and the trusted world then authenticates the content and
> > start the remote processor.
> > 
> > 
> > I think the difference in your case is that you have memory reserved
> > elsewhere, and you want the "load" operation to pass the firmware to the
> > TEE - which means that you need rproc_release_fw() to eventually clean
> > up the state if rproc_start() fails - and upon shutdown.
> 
> Yes the OP-TEE is make more stuff:
> - authenticate several firmware images

Please tell me how that work. I'm not able to see the multiple calls to
request_firmware()...

> - decrypt images if encrypted

This is done for some Qualcomm remoteprocs as well.

> - ensure that the load is done in granted memories

At the top of your reply you say that you're loading the firmware into
Linux memory, then you invoke TA_RPROC_FW_CMD_LOAD_FW to "load" it once
more - presumably copying into some other memory.

It sounds like this is an optimization to fail early in the case that
something is wrong?

> - manage the memory access rights to enure that the code and data memory
>  is never accessible by the Linux.
> 

Right, after authentication Linux must be locked out. That's done in the
Qualcomm "authenticate and start" phase, at the very end of the loading
and setting things up.

> > 
> > If we improve the definition of rproc_load_segments() to mean
> > "remoteproc (or remoteproc driver) is loading segments", then in your
> > case there's no "loading" operation in Linux. Instead you make that a
> > nop and invoke LOAD_FW and START_FW within your start callback, then you
> > can clean up the remnant state within your driver's start and stop
> > callbacks - without complicating the core framework.
> 
> This would not work as I need to load the firmware before calling
> rproc_handle_resources().
> 

Ohh, now I see what you're saying. This is why you should follow
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
when you write a commit message. Then I would have understood your
problem in the very first paragraph of the patch.

This very much sounds like what's intended to happen in
rproc_parse_fw(), per the comment right next to the call:

/* Load resource table, core dump segment list etc from the firmware */


But I'm guessing that would require loading the segments etc into the
destination memory, perform the authentication and then you can get hold
of the resource table?

Which..per your patch you do before calling rproc_fw_boot(), so you're
already diverging completely from the expected flow.

> I can not use rproc_prepare_device() as it is not called on recovery
> 

The purpose of rproc_prepare_device() is to ensure that any clocks etc
for the memory where we're going to load the firmware is enabled, so
that doesn't sounds like the right place.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> + * @release_fw:	optional function to release the firmware image from memories.
> >> + *		This function is called after stopping the remote processor or in case of error
> >>   */
> >>  struct rproc_ops {
> >>  	int (*prepare)(struct rproc *rproc);
> >> @@ -403,6 +407,8 @@ struct rproc_ops {
> >>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> >>  	unsigned long (*panic)(struct rproc *rproc);
> >>  	void (*coredump)(struct rproc *rproc);
> >> +	int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
> >> +	void (*release_fw)(struct rproc *rproc);
> >>  };
> >>  
> >>  /**
> >> -- 
> >> 2.25.1
> >>
