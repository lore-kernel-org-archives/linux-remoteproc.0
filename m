Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12855E4C
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 May 2024 17:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717176519; cv=none; b=rwI2v/NML6niC4URQXuU1iEIEN77pJagIPS4ulQtXahuOTkEJiZZYb7bitzUlSvj2UI8wzGKdlloUytkBHPwijAWtUFlexXZ6Np1+c0D7GNNnDM05HbwPuB+C7TRKeg1JZmt8HuN71oinibrO5xuMEBNlXFJf02ihMjsajcgCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717176519; c=relaxed/simple;
	bh=mE8SRr5pmWDgEPgzOnI666xlXsAzv9fUYw/yNBrhUXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhZW5skZpc1fl2EkTHJZwTRomKK5eVyWvxO45cK3cxJG6dwFwxYx1SUVSXCKR5ydFy4YF4tOsiXKVCdRUx+1CzUPUgMozuU70nVCCeUoMaYu12Iyr9w5QLl325GvBj1URgPtqn0F1E+Djj2fqfpxbPBl3g4mdpSL55o2fLdlSSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJCuDGtJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJCuDGtJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f62fae8c1aso11482695ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 May 2024 10:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717176517; x=1717781317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PIW/+d3pyitNysbRb4C74Z7GshTp0lM3THuiLkgE5rU=;
        b=HJCuDGtJtCzo4THLud6XJB5tCQfyEnAuCVMUMGcd+1UkrvLVWInuZ4NepimFc5Zy98
         VzpAzXcS6K42un8YTixwH2pxJ8SAtRJRi3AQ9R2nP70j0NOcihDwGf36ZMn49/UKhRYA
         oAvbyW8DdsFe+6HYCODRgalDrCYdRAeo37IO9IUPHwNha5LUGXSkhOnMmq1kKc7aTeue
         6YK0AGlXRY7OtoEFZvCHU2nPbQ01NegwbMfw1knl7eYUPziEm2Niuom9r1AYntSC/04S
         3+zJ3jKVmFVRD1I/zVoL0pVeqEwq9JQhSWIZ6gV8NDlhjrXmSBE7ufzQQMR+/eY6DAQ6
         n/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717176517; x=1717781317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIW/+d3pyitNysbRb4C74Z7GshTp0lM3THuiLkgE5rU=;
        b=iLZ/8xGxrtwrws5NUzLaJpSIgo1w3SLXWvB0e5I1d9oze0MdZ2LAWFupEDgT4o+dX4
         Hr+6JS5ciBsiME5nKfGZ64Y0/x/H7kl7Yehws2GjIGamubq4hwZiWC2yGWresgBeB06S
         PQ07sOSNAD1jghjwwgvuYOwMwMPNgP1RoxLGkrZIp16FirnLfM9Wcp+Z/zVRgYeXOu4m
         VfLAsUYmLJV4UOAlmIVLCsTWUSDykDoCuS4P3z6MuXGVRevXcESLDTQHqPlchFR8i1bX
         RowAcaYFUa1Vy3uoYWZcBavBBs9BGDATTMpDp4qXgLTeqxh58kqwCYxz8ZJzoMA2dcvz
         /Kaw==
X-Forwarded-Encrypted: i=1; AJvYcCWIzn4o7avEVNmyRM0MwF1kuiDXbFw8oDRwE062O380QaP6QIXIxu4l4zUWG7WdvXN8RB6kx5MwdLFObG27TFIJ9IWgnJ3f1hwzEjkUx5/9Og==
X-Gm-Message-State: AOJu0YwH2ReMJQbiyJ7BjwDfQ1QEL/YaDaR+IKWwczH+7daiy2o0Zc6e
	po/RcUba/UDexv8uRlRV3oeZmoCyPC8tf01uz/DZgoyiXHruDn8FOVd7oQgCvW0=
X-Google-Smtp-Source: AGHT+IHG+0RWeJvA4tpJNVMwbh8CPAHQBFYqLRjlNpPaCFJjsm76snXQhY0qYZq7twlxmQWy0+IYBQ==
X-Received: by 2002:a17:902:d30d:b0:1f4:990c:5ef1 with SMTP id d9443c01a7336-1f6370250c8mr24670045ad.31.1717176516593;
        Fri, 31 May 2024 10:28:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a236:3f96:dc60:48b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ded40sm19286015ad.169.2024.05.31.10.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 10:28:36 -0700 (PDT)
Date: Fri, 31 May 2024 11:28:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 5/7] remoteproc: core: support of the tee interface
Message-ID: <ZloIwfFwkpKYLU9k@p14s>
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

After spending more time on this I have the following 3 observations:

1) We need a ->cached_table, otherwise the crash recovery path gets really
messy.

2) It _might_ be a good idea to rename tee_rproc_get_loaded_rsc_table() to
tee_rproc_find_loaded_rsc_table() to be aligned with the scenario where the
firmware is loaded by the remoteproc core.  I think you had
tee_rproc_find_loaded_rsc_table() in the first place and I asked you to change
it.  If so, apologies - reviewing patches isn't an exact science.

3) The same way ->cached_table is created in rproc_elf_load_rsc_table(), which
is essentially ops::parse_fw(), we should create one in tee_rproc_parse_fw()
with a kmemdup().  Exactly the same as in rproc_elf_load_rsc_table().  In
tee_rproc_parse_fw(), @rsc_table should be iounmap'ed right away so that we
don't need to keep a local variable to free it later.  In rproc_start() the call
to rproc_find_loaded_rsc_table() will get another mapped handle to the resource
table in memory.  It might be a little unefficient but it sure beats doing a lot
of modifications in the core.

As I said above this isn't an exact science and we may need to changes more
things but at least it should take us a little further.

Thanks,
Mathieu

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
