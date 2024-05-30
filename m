Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B2210E7
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 May 2024 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717085670; cv=none; b=J/Li+7JkXt9Ldz2u9rNJHu7YbKFdvYBZgkIqr1pFk5HSnZSz/POzHHe2HK8CCzWo3kbGs/IIkubkwBcOAPDp+lzFxLrgLiLjpL/aUdYvBuu7liq3gPa0+fiAnNuGLRMM+fPSSi5RtgiBvLRxuX9JCTlXNmg4mYCK5W+v6RFGPaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717085670; c=relaxed/simple;
	bh=kQw9dYSnjCCynk++bbCtmFjN03+KlGjhcblfThpB8Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glzbtx0LeE9taiO2AszUo9be5QZoae5Srsnveiv1sW3DXJ/dJrhYZQH5lWnuf/9hMw+4DNzIPYQC2suOvENte4/4HQKcgeCPFe7KZs8dtR76aOWFckCLsUIkCO6JeAr7bJ9gsoRQa2jnmEsT6oK7sDxgi4TUYAEZjUNK9vZD4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQxPo+ZB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQxPo+ZB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f4c7b022f8so9865325ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 May 2024 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717085668; x=1717690468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6VUunGuJeLssKVobCfvvPjZ41Apn1YelEhi1TK/TFk=;
        b=eQxPo+ZBP80y19YRbQ2Xlw49kuqguIkzJUtJHns4QhkcILlGCSV410GCHok9q/fVAc
         JWjXbpF7cFWaFbSNXrEHseCbR//LwOT5MFS6Ak2z5+bSg03eW9rT8lU4Ouz6Izp1ENsM
         tli76Z1byLi0B47q2/GrUQfoAMH87EH2T35Wk8F16C8iUgWZCWgnh42pWq66nH+2lwjp
         dDDuCRTMDy0vY+SWYJgk537c6XykwWi6JaPJhgazMv59Zqt/IGOSJc+wUM4cy7GaG8Cg
         wmRHyHUa+JW9SbSVH4aAryMFTqZwI1YJ/qzfCg61PzLdSpBKqT5ovxCdP4chXYVr5Ove
         AksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717085668; x=1717690468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6VUunGuJeLssKVobCfvvPjZ41Apn1YelEhi1TK/TFk=;
        b=fxKg+FBnIRC5wSokESgJsaJGDEh5zCClze3665p2SwKgOpDS9My6oUDuwg994+mL1R
         eW2VkJXb/VWBh2aa1Uf4dHfv4WFKP3lWUk7G3lLh3kExGgLk9JZYU0YTFKJhyHKOUdYX
         scVhqOe9WJ41PUjZVHa06vzGololeAuBrXlAveY1Vbg4mFpUGOnpbkLembWeOSdM/eGn
         uZdUAts/7yHLoUZil03CnAaFHM07t/wCC9s2KFWURNhZkjjtS4A2GhJMXySvMn5SWjth
         59dg3Y9nJhUAT3Yft9BhyUHWNAK5QjD+YDM4apgblHjS/UiaPBgPlEzW2G1lCTeWgeYn
         z/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzGVGWeA/6kBQ6G7ojtfDrYLwtAnUpDRVDIp6/GzAT2PUsShGzNM0b+w6Hl5e0C7iw1xyqRP7B59e2XYhv1rPcap5bFj7qimmv+SQye/Fsqg==
X-Gm-Message-State: AOJu0YxKRfuT/KrXzWu66MBqiJWvZXUR/dixLbfAOflz3mnYlm4z+NVX
	XlfLrosAl3pDpo7L7JArnk0DkTvT8fkiaRPhWvN3S2wnDJU5tSyv/UNE9yFrke0=
X-Google-Smtp-Source: AGHT+IFqQKvjBFTB7gzCzLwMukiixRwSs187DU/Lq0gmjBTwVPSl82dbo3uyxiA4iHNgIZz5t+5qnQ==
X-Received: by 2002:a17:902:d509:b0:1f4:a6a5:4271 with SMTP id d9443c01a7336-1f6199365e6mr29505585ad.55.1717085668113;
        Thu, 30 May 2024 09:14:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed2:1ab5:d270:6de4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c99e3bdsm120465175ad.211.2024.05.30.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:14:27 -0700 (PDT)
Date: Thu, 30 May 2024 10:14:25 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 5/7] remoteproc: core: support of the tee interface
Message-ID: <Zlil4YSjHxb0FRgf@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
 <ZlZM/hgSO4EeRVqS@p14s>
 <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
 <ZleReEIgD8O5zATO@p14s>
 <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com>

On Thu, May 30, 2024 at 09:42:26AM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 5/29/24 22:35, Mathieu Poirier wrote:
> > On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
> >> Hello Mathieu,
> >>
> >> On 5/28/24 23:30, Mathieu Poirier wrote:
> >>> On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
> >>>> 1) on start:
> >>>> - Using the TEE loader, the resource table is loaded by an external entity.
> >>>> In such case the resource table address is not find from the firmware but
> >>>> provided by the TEE remoteproc framework.
> >>>> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
> >>>> - test that rproc->cached_table is not null before performing the memcpy
> >>>>
> >>>> 2)on stop
> >>>> The use of the cached_table seems mandatory:
> >>>> - during recovery sequence to have a snapshot of the resource table
> >>>>   resources used,
> >>>> - on stop to allow  for the deinitialization of resources after the
> >>>>   the remote processor has been shutdown.
> >>>> However if the TEE interface is being used, we first need to unmap the
> >>>> table_ptr before setting it to rproc->cached_table.
> >>>> The update of rproc->table_ptr to rproc->cached_table is performed in
> >>>> tee_remoteproc.
> >>>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> ---
> >>>>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
> >>>>  1 file changed, 23 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>>> index 42bca01f3bde..3a642151c983 100644
> >>>> --- a/drivers/remoteproc/remoteproc_core.c
> >>>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>>> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
> >>>>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
> >>>>  {
> >>>>  	struct resource_table *loaded_table;
> >>>> +	struct device *dev = &rproc->dev;
> >>>>  
> >>>>  	/*
> >>>>  	 * The starting device has been given the rproc->cached_table as the
> >>>> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
> >>>>  	 * this information to device memory. We also update the table_ptr so
> >>>>  	 * that any subsequent changes will be applied to the loaded version.
> >>>>  	 */
> >>>> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>>> -	if (loaded_table) {
> >>>> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >>>> -		rproc->table_ptr = loaded_table;
> >>>> +	if (rproc->tee_interface) {
> >>>> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
> >>>> +		if (IS_ERR(loaded_table)) {
> >>>> +			dev_err(dev, "can't get resource table\n");
> >>>> +			return PTR_ERR(loaded_table);
> >>>> +		}
> >>>> +	} else {
> >>>> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>>>  	}
> >>>>  
> >>>> +	if (loaded_table && rproc->cached_table)
> >>>> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >>>> +
> >>>
> >>> Why is this not part of the else {} above as it was the case before this patch?
> >>> And why was an extra check for ->cached_table added?
> >>
> >> Here we have to cover 2 use cases if rproc->tee_interface is set.
> >> 1) The remote processor is in stop state
> >>      - loaded_table points to the resource table in the remote memory and
> >>      -  rproc->cached_table is null
> >>      => no memcopy
> >> 2) crash recovery
> >>      - loaded_table points to the resource table in the remote memory
> >>      - rproc-cached_table point to a copy of the resource table
> > 
> > A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
> > But as the comment says [1], that part of the code was meant to be used for the
> > attach()/detach() use case.  Mixing both will become extremely confusing and
> > impossible to maintain.
> 
> i am not sure to understand your point here... the cached_table table was
> already existing for the "normal" case[2]. Seems to me that the cache table is
> needed on stop in all scenarios.
> 
> [2]
> https://elixir.bootlin.com/linux/v4.20.17/source/drivers/remoteproc/remoteproc_core.c#L1402
> 
> > 
> > I think the TEE scenario should be as similar as the "normal" one where TEE is
> > not involved.  To that end, I suggest to create a cached_table in
> > tee_rproc_parse_fw(), exactly the same way it is done in
> > rproc_elf_load_rsc_table().  That way the code path in
> > rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
> > work with when the remote processor is recovered.  In fact we may not need
> > rproc_set_rsc_table_on_start() at all but that needs to be asserted.
> 
> This is was I proposed in my V4 [3]. Could you please confirm that this aligns
> with what you have in mind?

Let me think a little - I'll get back to you.

> In such a case, should I keep the updates below in
> rproc_reset_rsc_table_on_stop(), or should I revert to using rproc->rsc_table to
> store the pointer to the resource table in tee_remoteproc for the associated
> memory map/unmap?"
> 
> [3]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20240308144708.62362-2-arnaud.pouliquen@foss.st.com/
> 
> Thanks,
> Arnaud
> 
> > 
> > [1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565
> > 
> >>      => need to perform the memcpy to reapply settings in the resource table
> >>
> >> I can duplicate the memcpy in if{} and else{} but this will be similar code
> >> as needed in both case.
> >> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
> >> reasonable as a memcpy from 0 should not be performed.
> >>
> >>
> >>>
> >>> This should be a simple change, i.e introduce an if {} else {} block to take
> >>> care of the two scenarios.  Plus the comment is misplaced now. 
> >>
> >> What about split it in 2 patches?
> >> - one adding the test on rproc->cached_table for the memcpy
> >> - one adding the if {} else {}?
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>
> >>>
> >>> More comments tomorrow.
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> +	rproc->table_ptr = loaded_table;
> >>>> +
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >>>>  	kfree(rproc->clean_table);
> >>>>  
> >>>>  out:
> >>>> -	/*
> >>>> -	 * Use a copy of the resource table for the remainder of the
> >>>> -	 * shutdown process.
> >>>> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
> >>>> +	 * before updating the proc->table_ptr reference.
> >>>>  	 */
> >>>> -	rproc->table_ptr = rproc->cached_table;
> >>>> +	if (!rproc->tee_interface) {
> >>>> +		/*
> >>>> +		 * Use a copy of the resource table for the remainder of the
> >>>> +		 * shutdown process.
> >>>> +		 */
> >>>> +		rproc->table_ptr = rproc->cached_table;
> >>>> +	}
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> -- 
> >>>> 2.25.1
> >>>>
