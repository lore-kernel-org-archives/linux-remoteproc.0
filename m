Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B05A254AF2
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 May 2025 15:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199032; cv=none; b=S3SYTqlaH6TZEs6Tz0VZt0tB5EPJ5ncvhkDhUUUbmG9xfjdVCBbtW+KPhcE8pe5Z/Q5fsy3QZz4goxKyGIe775UA+Ba9wdZNP9QP6fMZM0R6QF/Khw84J6fSkMzL5f6v4laEGpm6zOfteHBdMS0Qlml9hBzerA+izbRCvQ9QAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199032; c=relaxed/simple;
	bh=tuiJbKDRUgZ34W4XaPs1dsIKytW2AFQdGFVE0AKrcLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3Hbe4wd4B7Qk8+qQoBYy3avMyEb+4uJInsStNTKwXW3CgJ5yfVcmi1QlVrlwTnJ+AGJL+aKhjiQ77Yh2jN9bWtCEgd+SP2ucwV1YBlE8xkIf1ki8XOFlscjMd1hO3piRsfnapxxy7uWLqKgbp8+/kQ0SqGr0z4iE2cF16u+p2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0lt/i59; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0lt/i59"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so3315632a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746199028; x=1746803828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AXxc3n/MruayJFn3gaeXUe0NNPj0XJHc/kar7NkPI/A=;
        b=y0lt/i59QJticO/Tr8OYL6URq/CfnZGKpTtvUHG1j4MtYgso8Nl1yzKO+ofO2rPb+O
         QzbLj9StS+oiKem6gyq/hIgq7RddkwCPGMqLAYuFKqHC6rOkmU5f0jKO4ybgKcw+kpHq
         1JBx36ZwaBNJelUYTgf4qng3rPelHPP8VM990FEy5yX+HMkRYGc1doVlyfGINbuHAinA
         TUelbiwsGQEJ2oBbALjRkLT75FeS+aSRt928yMoZCRjHMvY3IbhcTTo0z9l7PrYWlNgW
         P7dgYZs48F0wpropugFqlqNF1J0b0YWx++uBTpJ7rWZ+/OkFlP1qnml4B8QcZJVGNNH6
         n8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199028; x=1746803828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXxc3n/MruayJFn3gaeXUe0NNPj0XJHc/kar7NkPI/A=;
        b=n52Oi9qxe11isPexYFvkjTPt8r+bRutVVzgVr8DqRlNLV5VGSpc4H4zN1/FdytF/UE
         92i3YLRDWVWIQtyumLaUNlpHw6t0Ie9imNKWYm1Amry2eEBrY81Yf3v3WNRHG3ZdP0s5
         jeBtpmRIHi0hQC4NVezikBPfd22TWEV/0Ota6gCGG1KHgzVzYKR2mMoWMiSnmXZHbOlY
         tqb5whtctdbPcVi1zwbyHaIPMTevtDIeMrgjVi/ZHZXSZSVUUoeytlO5uZNr+FPV0/Z2
         Br85Ilb45GA8koLGHlE5Sldenoe/GInfOUZcXdhvD7QTqr3Od4y4SiXmQO0e36g7h1r5
         Ugew==
X-Forwarded-Encrypted: i=1; AJvYcCWVBnhyAyVBmOALIYilmOMrlX6sSSYYSTlGoXpAe87mruCKvnHfeFXX2AX6eGo/klmQdMgQKn/YBhGfNpNCYD1r@vger.kernel.org
X-Gm-Message-State: AOJu0YzOlwOO6flNX4cO4ZtICJGat4027ldIRQFsmb3hGOQ2eaYaura6
	FR7vKkBFE3I1VFvT4BKssmlm/44ZL0Kb4jYjwFq0qWPVG8VX0/CG6KwNIhS1ZZbyTsangK8X17n
	l4mrJKlb9r5tDJ41aed+RRtGTDtQiT1Oz7LVvJg==
X-Gm-Gg: ASbGncvgL7kMGLeUodIUUwUuL4U0nEvmRjMTl5w8XEluX+CRasCrYD98VaPQAkvZky1
	plsRAlUGeVo9hBsC4ePJ+W2VmE7gT5zC3qI6KZaue66hpz42JHub4DQLfanJWknzNg8/xk7WwtQ
	bq8HaeNGEFBYqb/DkarzgF0a38mrMRFBFc3XkVpmzkr6Z7NhZd7WJMuJ+L
X-Google-Smtp-Source: AGHT+IG+mi9qQfA4kU4M9IL75mLEro4oWGSA/voUz0Wd3xc2bTnIAmyqD/JUse/m0ahL1W2pwTvz3tJceefmkRXoFa4=
X-Received: by 2002:a05:6402:518b:b0:5ed:c6aa:8c68 with SMTP id
 4fb4d7f45d1cf-5fa77fdcefamr2619478a12.5.1746199027537; Fri, 02 May 2025
 08:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425104135.830255-1-b-padhi@ti.com>
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 2 May 2025 09:16:56 -0600
X-Gm-Features: ATxdqUE6kLTVS-YQ527mOcNrgNuy918Zlmql8BSTLvzJ4DQ4x9L8cC-vdCgval0
Message-ID: <CANLsYkyBfhmxX5kXUcADsEuNUrOJXP6H27jDrCqsO845fp0Yog@mail.gmail.com>
Subject: Re: [PATCH v11 00/35] Refactor TI K3 R5, DSP and M4 Remoteproc Drivers
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com, 
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr, 
	jkangas@redhat.com, eballetbo@redhat.com, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have started reviewing this patchset but due to its size, it will
take me several days or weeks, depending on workload and other patches
on this list.  I will advise when I am done.

Thanks,
Mathieu

On Fri, 25 Apr 2025 at 04:41, Beleswar Padhi <b-padhi@ti.com> wrote:
>
> This series refactors a lot of functions & callbacks from
> ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
> drivers. This is a consolidated and final series as part of the
> refactoring of K3 remoteproc drivers. Below is the breakdown:
> 1. PATCHES #1-#3 fixes important bugs in R5 and DSP drivers before refactoring
> them into a common driver.
> 2. PATCHES #4-#10 does the pre-cleanup and aligns R5, DSP, M4 data structures.
> 3. PATCHES #11-#35 does the actual refactoring R5, DSP and M4 drivers into
> ti_k3_common.c driver.
>
> NOTE:
> This series supersedes below series:
> https://lore.kernel.org/all/20250219091042.263819-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250417182001.3903905-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250108063727.1416324-1-b-padhi@ti.com/
>
> Testing Done:
> 1. Tested boot of R5Fs, C66x DSPs, C71x DSPs across Jacinto J7* devices in
> remoteproc mode and IPC-Only mode.
> 2. Tested boot of M4F core _only_ in _AM62xx SK_ board in Remoteproc mode and
> IPC-Only mode.
> 3. Tested Core stop and detach operations from sysfs for R5Fs, C66x DSPs, C71x DSPs
> 4. Tested device removal paths by executing 'modprobe -r ti_k3_dsp_remoteproc'
> and 'modprobe -r ti_k3_r5_remoteproc'.
> 5. Tested usecases where firmware not available at device probe time, but
> later in sysfs, able to load firmware into a remotecore and start it. [R5Fs]
> 6. Tested that each patch in this series generates no new warnings/errors.
> 7. Tested IPC on AM64x EVM Device. [Thanks to Judith].
>
> v11: Changelog:
> 1. New patches: [v11 15/35] and [v11 18/35].
> Broken down rproc_reset() and rproc_release() refactoring patches into more
> atomic changes.
> 2. Carried T/B on all patches from Judith.
> 3. Carried A/B on [PATCH v11 13/35] by Andrew.
>
> Link to v10:
> https://lore.kernel.org/all/20250417182001.3903905-1-b-padhi@ti.com/
>
> v10: Changelog:
> 1. Re-ordered Bug Fixes to the start of the series, before starting pre-cleanup
> and finally the actual refactor. [Andrew]
> 2. Broken down commits into more atomic changes for ease of review. [Andrew].
> 3. Updated commit messages to have uniform flow throughout the series.
> 4. Carried R/B tags in applicable patches.
> 5. Further patch specific changelog is attached with patches.
>
> Link to v9:
> https://lore.kernel.org/all/20250317120622.1746415-1-b-padhi@ti.com/
>
> v9: Changelog:
> 1. Added R5 cleanup & refactoring along with existing DSP, M4 refactoring into this series. [Andrew]
> 2. Dropped Mailbox level IPC checks across R5, DSP, M4 drivers in IPC-only mode. [Andrew]
>
> Link to v8:
> https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com/
>
> v8: Changelog:
> 1. Broken down refactoring into patches, each patch dealing with one function
> for ease in review. [Andrew]
>
> Links to older versions:
> v7: https://lore.kernel.org/all/20240202175538.1705-1-hnagalla@ti.com/
> v6: https://lore.kernel.org/all/20230913111644.29889-1-hnagalla@ti.com/
> v5: https://lore.kernel.org/all/20230808044529.25925-1-hnagalla@ti.com/
> v4: https://lore.kernel.org/all/20230801141117.2559-1-hnagalla@ti.com/
> v3: https://lore.kernel.org/all/20230302171450.1598576-1-martyn.welch@collabora.com/
> v2: https://lore.kernel.org/all/20230301111323.1532479-4-martyn.welch@collabora.com/
> v1: https://lore.kernel.org/all/20220110040650.18186-1-hnagalla@ti.com/
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (33):
>   remoteproc: k3-r5: Refactor sequential core power up/down operations
>   remoteproc: k3-r5: Re-order internal memory initialization functions
>   remoteproc: k3-r5: Re-order k3_r5_release_tsp() function
>   remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4
>   remoteproc: k3-r5: Use k3_r5_rproc_mem_data structure for memory info
>   remoteproc: k3-{m4/dsp}: Add a void ptr member in rproc internal
>     struct
>   remoteproc: k3-m4: Add pointer to rproc struct within k3_m4_rproc
>   remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
>   remoteproc: k3: Refactor shared data structures
>   remoteproc: k3: Refactor mailbox rx_callback functions into common
>     driver
>   remoteproc: k3: Refactor .kick rproc ops into common driver
>   remoteproc: k3-dsp: Correct Reset logic for devices without lresets
>   remoteproc: k3-m4: Introduce central function to put rproc into reset
>   remoteproc: k3: Refactor rproc_reset() implementation into common
>     driver
>   remoteproc: k3-dsp: Correct Reset deassert logic for devices w/o
>     lresets
>   remoteproc: k3-m4: Introduce central function to release rproc from
>     reset
>   remoteproc: k3: Refactor rproc_release() implementation into common
>     driver
>   remoteproc: k3-m4: Ping the mbox while acquiring the channel
>   remoteproc: k3: Refactor rproc_request_mbox() implementations into
>     common driver
>   remoteproc: k3-dsp: Don't override rproc ops in IPC-only mode
>   remoteproc: k3-dsp: Assert local reset during .prepare callback
>   remoteproc: k3: Refactor .prepare rproc ops into common driver
>   remoteproc: k3: Refactor .unprepare rproc ops into common driver
>   remoteproc: k3: Refactor .start rproc ops into common driver
>   remoteproc: k3: Refactor .stop rproc ops into common driver
>   remoteproc: k3: Refactor .attach rproc ops into common driver
>   remoteproc: k3: Refactor .detach rproc ops into common driver
>   remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
>   remoteproc: k3: Refactor .da_to_va rproc ops into common driver
>   remoteproc: k3: Refactor of_get_memories() functions into common
>     driver
>   remoteproc: k3: Refactor mem_release() functions into common driver
>   remoteproc: k3: Refactor reserved_mem_init() functions into common
>     driver
>   remoteproc: k3: Refactor release_tsp() functions into common driver
>
> Siddharth Vadapalli (2):
>   remoteproc: k3-r5: Drop check performed in
>     k3_r5_rproc_{mbox_callback/kick}
>   remoteproc: k3-dsp: Drop check performed in
>     k3_dsp_rproc_{mbox_callback/kick}
>
>  drivers/remoteproc/Makefile               |    4 +-
>  drivers/remoteproc/ti_k3_common.c         |  547 +++++++++++
>  drivers/remoteproc/ti_k3_common.h         |  113 +++
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  616 +------------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  583 +-----------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 1012 +++++++--------------
>  6 files changed, 1072 insertions(+), 1803 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_k3_common.c
>  create mode 100644 drivers/remoteproc/ti_k3_common.h
>
> --
> 2.34.1
>
