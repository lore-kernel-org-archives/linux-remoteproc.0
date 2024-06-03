Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C971D54B
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Jun 2024 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717424677; cv=none; b=btIyBppAc7JgrdouuNJG6xkEJyaiIqclidw9rKS7rSlQ60r5lXG8jJ4vyIlcZEFqmuDOQ1kBpuqcjkBHJz+raVFgTSyWcmimtGTc7tfnHWkH9hIGyUFwEi9TgXG2cYBGSge4RiMxrwBvqpyw597e2p5mw44HYaIRcHPN7jngYP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717424677; c=relaxed/simple;
	bh=fGz33xrm67s/3xOHzi6aui49BF2BT8E4NGLtM0smGzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCK5Tos8EgwL6pjCU0wIrLGMAkuuGHxhERAP2ca09d90agV5YOoZ6Yx+u9DMWFxQ3/Waner2caPqn0nORvfUwSdSPyoySUvBpEhLJx0lsR19820eOr8TLBr4kZx11s02Ab7BDWJV+I8yup2ZjJUMxiKX7X9IMsTZpp/vUi/Eg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2NIJJ2b; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2NIJJ2b"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b912198a6so1882382e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Jun 2024 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717424674; x=1718029474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HU67Frz4KLIhKgIgnFIoqv4QJpo9MobOI1TbJCtTOKA=;
        b=c2NIJJ2bK6WqFv5Qsf+bO2Hy4ysU3AeoCalAlQzXTPBf8V/hxBvFzh0ElSRO06L3ch
         nrd6xg6TXKupXMuEnvjDnuporii6fkRuNDdfhP4DxhS5B34hCcAHabRhuRGQNlBwLe+w
         UZXAhIkIJWSvj+HwAywJz1lt7JLLz9Cv7JwgnK9qUbaLgjS1e/ghn1RgxeLWDhvP5G7u
         /jnbUz7xEJKtjAttA2PJKeYewMT1VFxw6uiv434iQwCiEP0CwDKB5CP3kZYd/zHHJCB0
         VwzUHdlDA3M6GxoQ3cPjzKVF4te4inkPr4UzZoXR3yt5Q2ybGfLj3onripX3JtOnjJ20
         AoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717424674; x=1718029474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HU67Frz4KLIhKgIgnFIoqv4QJpo9MobOI1TbJCtTOKA=;
        b=SzpO7w/y17nruOacU8MUdeshr1hfFWlBqdVxh9LB1IeApdXbJVCx1+DBooG5OXW3DU
         C2/GOpI6A6MJlk3Cuk36bt5AVDLzlpDGSuXShvr6fKbpCPZM2fgy+nVBmDLjwglBEL3a
         32VSLtJNHMreMTpFmJofPYnkcvx9hjm+mwgUMyBDa2JFoKRElSaMCKK5YaLINSwbYASG
         YsH+VV/K0i2ofV6XijanvZWAXzPF2g1/HP9V9SN/FaCtv04KR/7OKQqlEBOBIMkLzCz3
         YiZUq5HJiw8g5NZYGZImbpNVnQ4DbukPlfA/ssRg1kPAOEv2lVQ4j9wdnDD5Ab+oYLw5
         +cRA==
X-Forwarded-Encrypted: i=1; AJvYcCUTJU5sg4GPttoi49OWBci60hVn8T2HA1sIKPxKzuEuWl/29xsC9dPJ/Sds5OV5CApDJf3Dk4I0i7ulWUFhMkfSX4sOrm3weGNfRNSB9LQxlw==
X-Gm-Message-State: AOJu0YxtWh0b8Ncw6C18eSKYyPZmQd2ovywDLv1r6BLP2SZMlcdpGQCG
	w2hk+Tq+Q2/W1SPdNAnpehG4cnPoQoTEep/QpT4HUaNKaMdJ397zlyJZ3Bo5YPidEgGZhcp8Yvz
	39P8amiDexhFOMkm+J0mJzYjPcj+r5GUxTV9Avw==
X-Google-Smtp-Source: AGHT+IFSkxpmdDquL3WnBhvl8mkF9cp/jBUTPsK7w7Fy+lvXPrOrD8Bxo9GvPPtUOX2jGfVSOpcaXCUHE8mly6n5yrM=
X-Received: by 2002:a19:8c1e:0:b0:522:34a9:a7e7 with SMTP id
 2adb3069b0e04-52b89576a71mr6693705e87.22.1717424673764; Mon, 03 Jun 2024
 07:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com> <ZlZM/hgSO4EeRVqS@p14s>
 <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com> <ZleReEIgD8O5zATO@p14s>
 <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com> <ZloIwfFwkpKYLU9k@p14s> <047e31c6-1b6d-4792-a913-4197e2e53b32@foss.st.com>
In-Reply-To: <047e31c6-1b6d-4792-a913-4197e2e53b32@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 3 Jun 2024 08:24:22 -0600
Message-ID: <CANLsYkx4MeUwoFF9aUutdQxOaLbbJ7q0cWw+EMVDXoprnm8QLA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] remoteproc: core: support of the tee interface
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jun 2024 at 02:22, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 5/31/24 19:28, Mathieu Poirier wrote:
> > On Thu, May 30, 2024 at 09:42:26AM +0200, Arnaud POULIQUEN wrote:
> >> Hello Mathieu,
> >>
> >> On 5/29/24 22:35, Mathieu Poirier wrote:
> >>> On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
> >>>> Hello Mathieu,
> >>>>
> >>>> On 5/28/24 23:30, Mathieu Poirier wrote:
> >>>>> On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
> >>>>>> 1) on start:
> >>>>>> - Using the TEE loader, the resource table is loaded by an external entity.
> >>>>>> In such case the resource table address is not find from the firmware but
> >>>>>> provided by the TEE remoteproc framework.
> >>>>>> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
> >>>>>> - test that rproc->cached_table is not null before performing the memcpy
> >>>>>>
> >>>>>> 2)on stop
> >>>>>> The use of the cached_table seems mandatory:
> >>>>>> - during recovery sequence to have a snapshot of the resource table
> >>>>>>   resources used,
> >>>>>> - on stop to allow  for the deinitialization of resources after the
> >>>>>>   the remote processor has been shutdown.
> >>>>>> However if the TEE interface is being used, we first need to unmap the
> >>>>>> table_ptr before setting it to rproc->cached_table.
> >>>>>> The update of rproc->table_ptr to rproc->cached_table is performed in
> >>>>>> tee_remoteproc.
> >>>>>>
> >>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>>>> ---
> >>>>>>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
> >>>>>>  1 file changed, 23 insertions(+), 8 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>>>>> index 42bca01f3bde..3a642151c983 100644
> >>>>>> --- a/drivers/remoteproc/remoteproc_core.c
> >>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>>>>> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
> >>>>>>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
> >>>>>>  {
> >>>>>>          struct resource_table *loaded_table;
> >>>>>> +        struct device *dev = &rproc->dev;
> >>>>>>
> >>>>>>          /*
> >>>>>>           * The starting device has been given the rproc->cached_table as the
> >>>>>> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
> >>>>>>           * this information to device memory. We also update the table_ptr so
> >>>>>>           * that any subsequent changes will be applied to the loaded version.
> >>>>>>           */
> >>>>>> -        loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>>>>> -        if (loaded_table) {
> >>>>>> -                memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >>>>>> -                rproc->table_ptr = loaded_table;
> >>>>>> +        if (rproc->tee_interface) {
> >>>>>> +                loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
> >>>>>> +                if (IS_ERR(loaded_table)) {
> >>>>>> +                        dev_err(dev, "can't get resource table\n");
> >>>>>> +                        return PTR_ERR(loaded_table);
> >>>>>> +                }
> >>>>>> +        } else {
> >>>>>> +                loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>>>>>          }
> >>>>>>
> >>>>>> +        if (loaded_table && rproc->cached_table)
> >>>>>> +                memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >>>>>> +
> >>>>>
> >>>>> Why is this not part of the else {} above as it was the case before this patch?
> >>>>> And why was an extra check for ->cached_table added?
> >>>>
> >>>> Here we have to cover 2 use cases if rproc->tee_interface is set.
> >>>> 1) The remote processor is in stop state
> >>>>      - loaded_table points to the resource table in the remote memory and
> >>>>      -  rproc->cached_table is null
> >>>>      => no memcopy
> >>>> 2) crash recovery
> >>>>      - loaded_table points to the resource table in the remote memory
> >>>>      - rproc-cached_table point to a copy of the resource table
> >>>
> >>> A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
> >>> But as the comment says [1], that part of the code was meant to be used for the
> >>> attach()/detach() use case.  Mixing both will become extremely confusing and
> >>> impossible to maintain.
> >>
> >> i am not sure to understand your point here... the cached_table table was
> >> already existing for the "normal" case[2]. Seems to me that the cache table is
> >> needed on stop in all scenarios.
> >>
> >> [2]
> >> https://elixir.bootlin.com/linux/v4.20.17/source/drivers/remoteproc/remoteproc_core.c#L1402
> >>
> >>>
> >>> I think the TEE scenario should be as similar as the "normal" one where TEE is
> >>> not involved.  To that end, I suggest to create a cached_table in
> >>> tee_rproc_parse_fw(), exactly the same way it is done in
> >>> rproc_elf_load_rsc_table().  That way the code path in
> >>> rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
> >>> work with when the remote processor is recovered.  In fact we may not need
> >>> rproc_set_rsc_table_on_start() at all but that needs to be asserted.
> >>
> >> This is was I proposed in my V4 [3]. Could you please confirm that this aligns
> >> with what you have in mind?
> >
> > After spending more time on this I have the following 3 observations:
> >
> > 1) We need a ->cached_table, otherwise the crash recovery path gets really
> > messy.
> >
> > 2) It _might_ be a good idea to rename tee_rproc_get_loaded_rsc_table() to
> > tee_rproc_find_loaded_rsc_table() to be aligned with the scenario where the
> > firmware is loaded by the remoteproc core.  I think you had
> > tee_rproc_find_loaded_rsc_table() in the first place and I asked you to change
> > it.  If so, apologies - reviewing patches isn't an exact science.
> >
> > 3) The same way ->cached_table is created in rproc_elf_load_rsc_table(), which
> > is essentially ops::parse_fw(), we should create one in tee_rproc_parse_fw()
> > with a kmemdup().  Exactly the same as in rproc_elf_load_rsc_table().  In
> > tee_rproc_parse_fw(), @rsc_table should be iounmap'ed right away so that we
> > don't need to keep a local variable to free it later.  In rproc_start() the call
> > to rproc_find_loaded_rsc_table() will get another mapped handle to the resource
> > table in memory.  It might be a little unefficient but it sure beats doing a lot
> > of modifications in the core.
>
> Remapping the resource table in rproc_find_loaded_rsc_table will require that we
> unmap it on rproc_stop before updating rproc->table_ptr to rproc->cached_table.
>

Exactly.

> On the other hand, I wonder if declaring the memory region in the stm32-rproc DT
> node would address this second mapping and avoid a map in
> rproc_find_loaded_rsc_table().
>

That would be even better.

> I will do the V6 integrating your suggestions and having a deeper look on the
> resource table map/unmap.
>
> >
> > As I said above this isn't an exact science and we may need to changes more
> > things but at least it should take us a little further.
>
> That seems to me reasonable and part of the normal upstream process :)
>
>
> Thanks,
> Arnaud
>
> >
> > Thanks,
> > Mathieu
> >
> >> In such a case, should I keep the updates below in
> >> rproc_reset_rsc_table_on_stop(), or should I revert to using rproc->rsc_table to
> >> store the pointer to the resource table in tee_remoteproc for the associated
> >> memory map/unmap?"
> >>
> >> [3]
> >> https://patchwork.kernel.org/project/linux-remoteproc/patch/20240308144708.62362-2-arnaud.pouliquen@foss.st.com/
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>>
> >>> [1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565
> >>>
> >>>>      => need to perform the memcpy to reapply settings in the resource table
> >>>>
> >>>> I can duplicate the memcpy in if{} and else{} but this will be similar code
> >>>> as needed in both case.
> >>>> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
> >>>> reasonable as a memcpy from 0 should not be performed.
> >>>>
> >>>>
> >>>>>
> >>>>> This should be a simple change, i.e introduce an if {} else {} block to take
> >>>>> care of the two scenarios.  Plus the comment is misplaced now.
> >>>>
> >>>> What about split it in 2 patches?
> >>>> - one adding the test on rproc->cached_table for the memcpy
> >>>> - one adding the if {} else {}?
> >>>>
> >>>> Thanks,
> >>>> Arnaud
> >>>>
> >>>>
> >>>>>
> >>>>> More comments tomorrow.
> >>>>>
> >>>>> Thanks,
> >>>>> Mathieu
> >>>>>
> >>>>>> +        rproc->table_ptr = loaded_table;
> >>>>>> +
> >>>>>>          return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >>>>>>          kfree(rproc->clean_table);
> >>>>>>
> >>>>>>  out:
> >>>>>> -        /*
> >>>>>> -         * Use a copy of the resource table for the remainder of the
> >>>>>> -         * shutdown process.
> >>>>>> +        /* If the remoteproc_tee interface is used, then we have first to unmap the resource table
> >>>>>> +         * before updating the proc->table_ptr reference.
> >>>>>>           */
> >>>>>> -        rproc->table_ptr = rproc->cached_table;
> >>>>>> +        if (!rproc->tee_interface) {
> >>>>>> +                /*
> >>>>>> +                 * Use a copy of the resource table for the remainder of the
> >>>>>> +                 * shutdown process.
> >>>>>> +                 */
> >>>>>> +                rproc->table_ptr = rproc->cached_table;
> >>>>>> +        }
> >>>>>>          return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> --
> >>>>>> 2.25.1
> >>>>>>
