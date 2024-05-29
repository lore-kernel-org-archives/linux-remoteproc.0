Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95201B960
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 May 2024 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717014910; cv=none; b=lMVPe8BQg2n+LZxSnpsK35QOe9K7ESrUPxaPCfI8ItKxvEQ4+FsTTlyseLf9s6rXgQBbpOArYNSF4ZxYYCHDkce2ekg8nM6AICl2m66/rymf+Iwsyjyf2l09t60+a9jM5CtaOWCvJ3DuSUkqA+xgCG+WsE1TTfU8uVx9EzI5ku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717014910; c=relaxed/simple;
	bh=fapBRwr7N+bwxyICl1DbraOozMbVgHVNKigU8lMsAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dw8m56LCkfTL0ZuVjKLMtWca1Ld1uElSHKoephfS0KuaB/sofk/1RPINFHWA8Opui7ElbwMTKlj8YXRGDAU8rImDKAKE/sADISPJryJBxOtQ5ZjGQnINtE1DccJyZbx8536nAtXmjhlCIP0MZU5Djj8b4FtyWAC7+oGGJO06FQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CKwZ6vKp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CKwZ6vKp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7022cabdc0aso305692b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 May 2024 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717014908; x=1717619708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4R2w4xWQ6PatLB6R5HSZ3uYzsk47/bCihA9HMiSc+o=;
        b=CKwZ6vKpENAgvaRC4iAqT6Ko5NaIT+5CVSAL7ggVoByMNfagwDGcbY3wjZqvLvPTG2
         2oxwrGbE0NtWwJ08LmyFsxXI0mp2wtBXk8SsK3D44bKaXjnjFvxmc/oGZIS2KY3Yinbp
         LJicoUbwlcpfN21r0M4BwQqL1w6Jb84hqVqYaOG5REZkok17Bd8PkFa5KqsOX3NkJ65P
         1ULoZJIw3LzrKROu2wP4wpRgtj3jbEmLxZKVDZ6VkcoGXoflBFcK5OtWuucMKkchFkeo
         0dOdRRhZblw0HQCrlhc6XnO57RdAffiUES5MZWxDKIsZ6T4simhaFKDRsmIQGXq9voCe
         KYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717014908; x=1717619708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4R2w4xWQ6PatLB6R5HSZ3uYzsk47/bCihA9HMiSc+o=;
        b=fzxXbjvoi1W61EAIztpDmBdZVfwoskEhJ8+r3UFclZHSAycW8P/7nOtq7wbxcFB8BG
         qgvLC4FnZBKVU4vNxFo6oNJ4tn+xdjnIjFNn6369E7VEh4+IAlU4Io48vvO2ncPzE0dX
         ZXMwae7PeOYcMxlKT80A5/Z2AJ1p2xzDOChSPKKfKpceBEpEjKLwYgoiyPz6DefpDtr8
         uXlrnzH31Lo5nbSYKfKOyyuzlDX/7B1zcA0aB6A14gDd7l2x8PeH76LfT5XYFPJ6E6hT
         8vG9gZdaNdG2QyKbVw1PEFWn1nH7+UMusDBtmOLGaITeeABdZILtlmDf/X9Cnsk4YF4+
         1hIw==
X-Forwarded-Encrypted: i=1; AJvYcCVKKFdnV4v1+21np8WR7PquHirjqa8hvAwyBQpJIwUIho4FVqoGPR5BmVAbRbgDM60FlubYi62LRESujcxwW2pQ077H0XAVAd7uoM+OJh712Q==
X-Gm-Message-State: AOJu0Yz8zhQ/C8AGjyHP0NJd1l9ti6iPc8TiTZyoKlPXYsaD6acIV54U
	YrHAOUkOsdn/BC7SkZWcKKiY4ZIZoCPxcXp1CxXaN5a1Fl4Np9+PZ76ft1R0gfA=
X-Google-Smtp-Source: AGHT+IG5f8QdrwFNWTz+gMWVv1LraPXZQk/5mqFSbYPG/HdxM6UCLn6jBEyoiEpoKriP0ewd/4J1Vg==
X-Received: by 2002:a05:6a21:1f28:b0:1a9:d27c:3151 with SMTP id adf61e73a8af0-1b259aba6ebmr4090148637.23.1717014907887;
        Wed, 29 May 2024 13:35:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bffd:785e:5b80:dd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822092b723sm8034692a12.14.2024.05.29.13.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 13:35:07 -0700 (PDT)
Date: Wed, 29 May 2024 14:35:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 5/7] remoteproc: core: support of the tee interface
Message-ID: <ZleReEIgD8O5zATO@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
 <ZlZM/hgSO4EeRVqS@p14s>
 <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>

On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 5/28/24 23:30, Mathieu Poirier wrote:
> > On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
> >> 1) on start:
> >> - Using the TEE loader, the resource table is loaded by an external entity.
> >> In such case the resource table address is not find from the firmware but
> >> provided by the TEE remoteproc framework.
> >> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
> >> - test that rproc->cached_table is not null before performing the memcpy
> >>
> >> 2)on stop
> >> The use of the cached_table seems mandatory:
> >> - during recovery sequence to have a snapshot of the resource table
> >>   resources used,
> >> - on stop to allow  for the deinitialization of resources after the
> >>   the remote processor has been shutdown.
> >> However if the TEE interface is being used, we first need to unmap the
> >> table_ptr before setting it to rproc->cached_table.
> >> The update of rproc->table_ptr to rproc->cached_table is performed in
> >> tee_remoteproc.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
> >>  1 file changed, 23 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 42bca01f3bde..3a642151c983 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
> >>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
> >>  {
> >>  	struct resource_table *loaded_table;
> >> +	struct device *dev = &rproc->dev;
> >>  
> >>  	/*
> >>  	 * The starting device has been given the rproc->cached_table as the
> >> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
> >>  	 * this information to device memory. We also update the table_ptr so
> >>  	 * that any subsequent changes will be applied to the loaded version.
> >>  	 */
> >> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >> -	if (loaded_table) {
> >> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >> -		rproc->table_ptr = loaded_table;
> >> +	if (rproc->tee_interface) {
> >> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
> >> +		if (IS_ERR(loaded_table)) {
> >> +			dev_err(dev, "can't get resource table\n");
> >> +			return PTR_ERR(loaded_table);
> >> +		}
> >> +	} else {
> >> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>  	}
> >>  
> >> +	if (loaded_table && rproc->cached_table)
> >> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >> +
> > 
> > Why is this not part of the else {} above as it was the case before this patch?
> > And why was an extra check for ->cached_table added?
> 
> Here we have to cover 2 use cases if rproc->tee_interface is set.
> 1) The remote processor is in stop state
>      - loaded_table points to the resource table in the remote memory and
>      -  rproc->cached_table is null
>      => no memcopy
> 2) crash recovery
>      - loaded_table points to the resource table in the remote memory
>      - rproc-cached_table point to a copy of the resource table

A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
But as the comment says [1], that part of the code was meant to be used for the
attach()/detach() use case.  Mixing both will become extremely confusing and
impossible to maintain.

I think the TEE scenario should be as similar as the "normal" one where TEE is
not involved.  To that end, I suggest to create a cached_table in
tee_rproc_parse_fw(), exactly the same way it is done in
rproc_elf_load_rsc_table().  That way the code path in
rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
work with when the remote processor is recovered.  In fact we may not need
rproc_set_rsc_table_on_start() at all but that needs to be asserted.

[1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565

>      => need to perform the memcpy to reapply settings in the resource table
> 
> I can duplicate the memcpy in if{} and else{} but this will be similar code
> as needed in both case.
> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
> reasonable as a memcpy from 0 should not be performed.
> 
> 
> > 
> > This should be a simple change, i.e introduce an if {} else {} block to take
> > care of the two scenarios.  Plus the comment is misplaced now. 
> 
> What about split it in 2 patches?
> - one adding the test on rproc->cached_table for the memcpy
> - one adding the if {} else {}?
> 
> Thanks,
> Arnaud
> 
> 
> > 
> > More comments tomorrow.
> > 
> > Thanks,
> > Mathieu
> > 
> >> +	rproc->table_ptr = loaded_table;
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >>  	kfree(rproc->clean_table);
> >>  
> >>  out:
> >> -	/*
> >> -	 * Use a copy of the resource table for the remainder of the
> >> -	 * shutdown process.
> >> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
> >> +	 * before updating the proc->table_ptr reference.
> >>  	 */
> >> -	rproc->table_ptr = rproc->cached_table;
> >> +	if (!rproc->tee_interface) {
> >> +		/*
> >> +		 * Use a copy of the resource table for the remainder of the
> >> +		 * shutdown process.
> >> +		 */
> >> +		rproc->table_ptr = rproc->cached_table;
> >> +	}
> >>  	return 0;
> >>  }
> >>  
> >> -- 
> >> 2.25.1
> >>
