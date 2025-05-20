Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CF1C5F10
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 17:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762073; cv=none; b=KQiSe+2mJFA0oq146Bt9BGWlII/SQhrNNhp/kU7NFj/UzfauCBWIHDv6bRSsxtbLsCBEwMQCeRHxv0aDviOa1tce4WWvRWz/f7uj04L2kdOVdAIAecDpBCRaIO0jXro7s+znkBVjQsQfZSA0U8npj/p6bSrQlSMebwIz55m11z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762073; c=relaxed/simple;
	bh=tIa5+YdrgGJbeyk0UHOg0IX4f7FfivGmhOh0TiLpCGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUoX8aVSqcjxRlT+JSKlI0R+Arn+oiGH7/JCrnuPQr9odKjcUeoWSA3q5jU6A2BEjyMvNtHExj9Loiol79nE2ho090hQPQwIEsyh1wIcBK9NtEX3aqxqQBK0B+OQC99eHpp/zsoeP4qkIQajFQCMFeVb0pBSoMAxoBMKzfCoieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nNL/EYU2; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNL/EYU2"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6717138b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 10:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747762071; x=1748366871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lGpWma/mkgur6OYR/XInOzF4YmcPnIMGWHs3eog6BDU=;
        b=nNL/EYU22ld7I2s8lVcRZe5inUbzSMB989akpLO9EaykBhtuBqGzjQ33kk2FbukL5n
         GX170YSshuzrEtsNyKl5K7KlbbQAu209ys7jlYWYmX9Xp/cCx4+YYS6Rf4UsQZT0OOS1
         8n4ZAv+Gs+AbSuY8Cau7IbQyGn8Zn56f7JE3EunQbDr7nktJuSEY3gX9uDCZBpHQSv+D
         /vHAtVhtrAXRf7yxQdoXkSHl1L3qG0pUYUTjhoD6lsX8sgz9eh2a9b8BCde5FeaxR3Zi
         Gx9Jz4blASwBD3W9UX/hY9nBFP1ihIxZhtJkG6SsJfAzLTS2Jpj6WyzS5hWjyBVM5AYM
         wf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747762071; x=1748366871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGpWma/mkgur6OYR/XInOzF4YmcPnIMGWHs3eog6BDU=;
        b=d5O6TToHvWFi1njBOLjYZ0W55ZZWSHu/U9Lgnv/Ff3lM7W370fcKhx8mV024/YTty1
         uZbuZzvZfkRVJ7KqaaPIxHZM7IVvhuLsQG3Cd4JLd0sJ4XC2fTcO43HfjndoMQ9rGMS+
         uN+H8zMt7Fh/21uPg4yxm2rCJwMVsUuNAaWD5RH/Fx7knEg+igL3cPtfG1dMXC50/rj5
         Ic/w07MQx06tkT1exbHySs9u2za4XuLxZnZWDBLoJdYtN32xVFUzFbn79+XTkqc27LVT
         uesW8i1F9B79GaA5EARuJCPJd/uymxF+bXjBYnN5yIqodNRMk2hyW1VwaE23D4jx7mYF
         WlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqD8OlP9I4fXmA0UTh7ajsuryHLzpJZGRGkCSnlK0ByfBgDqzaHzWb8FhMA4n2nVtvZyQQvrYFDtDPncia+g4S@vger.kernel.org
X-Gm-Message-State: AOJu0YwbLoCdW0Y4xfT51L5a6fePqJ08kQha9qIvfTI0e2HuV4uuVBV4
	rWK+mkZMWGHFUMk7c+KkJHkSuR8Qo+ANxFL9jKGmGicn+JW+5zIBOwlqZ/gu86Gb6tc=
X-Gm-Gg: ASbGncvlQxJoRTyeOYbJWizQTwCb5Q/3jxq1C5AQwKvIBIL0QNOl1VhfafKtr+I1EmU
	W7erU2HbkP6DFMm3EZE1FS5jf1hkpVmQ91Fcm8DvmGbjqSKzphSH70WoBZDPl2udkrOI5DiYpyb
	y64Bc05D8BTGHoIyD5GO5mwEz2aB6x3L2yDYT/cjwMlgsUGuOAvmW3LePIceKJ8/MKU8mu0Mqd8
	0bNHW4Z6D8ZTJPwhSDsQ3hFa7P3nZLmLqTzVu82Y5SmL6inkWV2q2qJy3Ah/HLKmZPmGUH/XYGt
	n6MvRmJ4ACqm99p55G84iMXqzwIjHfpMzdKlPCYNbhO9alyKhYZInEI=
X-Google-Smtp-Source: AGHT+IELypXCxTME3C0bL7DzwGSM3WRIMiTXXR8LqUFOs6w45ETIPpXrqk/LociLoe4DQYW/eQP5VA==
X-Received: by 2002:a05:6a20:7f9d:b0:1ee:e33d:f477 with SMTP id adf61e73a8af0-216218a2a6bmr28540459637.15.1747762071319;
        Tue, 20 May 2025 10:27:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6d36:6772:76af:26a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm8400493b3a.147.2025.05.20.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:27:50 -0700 (PDT)
Date: Tue, 20 May 2025 11:27:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/36] Refactor TI K3 R5, DSP and M4 Remoteproc
 Drivers
Message-ID: <aCy7lNJt6bFvzud2@p14s>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>

On Tue, May 13, 2025 at 11:14:34AM +0530, Beleswar Padhi wrote:
> This series refactors a lot of functions & callbacks from
> ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
> drivers. This is a consolidated and final series as part of the
> refactoring of K3 remoteproc drivers. Below is the breakdown:
> 1. PATCHES #1-#4 fixes important bugs in R5 and DSP drivers before refactoring
> them into a common driver.
> 2. PATCHES #5-#11 does the pre-cleanup and aligns R5, DSP, M4 data structures.
> 3. PATCHES #12-#36 does the actual refactoring R5, DSP and M4 drivers into
> ti_k3_common.c driver.
> 
> NOTE:
> This series supersedes below series:
> https://lore.kernel.org/all/20250219091042.263819-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250425104135.830255-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250108063727.1416324-1-b-padhi@ti.com/
> 
> Testing Done:
> 1. Tested boot of R5Fs, C66x DSPs, C71x DSPs across Jacinto J7* devices in
> remoteproc mode and IPC-Only mode.
> 2. Tested boot of M4F core _only_ in _AM62xx SK_ board in Remoteproc mode and
> IPC-Only mode.
> 3. Tested Core stop and detach operations from sysfs for R5Fs, C66x DSPs, C71x
> DSPs
> 4. Tested device removal paths by executing 'modprobe -r ti_k3_dsp_remoteproc'
> and 'modprobe -r ti_k3_r5_remoteproc'.
> 5. Tested usecases where firmware not available at device probe time, but
> later in sysfs, able to load firmware into a remotecore and start it. [R5Fs]
> 6. Tested that each patch in this series generates no new warnings/errors.
> 7. Tested IPC on AM64x EVM Device. [Thanks to Judith].
> 8. Tested compilation of the remoteproc drivers as modules.
> 
> v12: Changelog:
> Mathieu:
> 1. Use data pointer to set num_mems in PATCHES [08/36] and [11/36].
> 2. Declare const before variables in PATCH [11/35].
> 3. Compile ti_k3_common driver with ti_k3_r5_remoteproc driver in PATCH [13/36].
> General:
> 1. New patch: [04/36]. Fix the state detection logic in M4 driver to prevent
> resetting the rproc in detach routine.
> 2. Update comments in ti_k3_common.{h/c} files to call out it is refactored out
> of R5, DSP and M4 drivers in PATCHES [12/36] and [13/36].
> 3. Carry R/B Tags from Andrew throughout series.
> 
> Link to v11:
> https://lore.kernel.org/all/20250425104135.830255-1-b-padhi@ti.com/
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
> 1. Added R5 cleanup & refactoring along with existing DSP, M4 refactoring into
> this series. [Andrew]
> 2. Dropped Mailbox level IPC checks across R5, DSP, M4 drivers in IPC-only mode.
> [Andrew] 
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
> Beleswar Padhi (34):
>   remoteproc: k3-r5: Refactor sequential core power up/down operations
>   remoteproc: k3-m4: Don't assert reset in detach routine
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
>  drivers/remoteproc/Makefile               |    6 +-
>  drivers/remoteproc/ti_k3_common.c         |  551 +++++++++++
>  drivers/remoteproc/ti_k3_common.h         |  118 +++
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  616 +------------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  583 +-----------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 1018 +++++++--------------
>  6 files changed, 1088 insertions(+), 1804 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_k3_common.c
>  create mode 100644 drivers/remoteproc/ti_k3_common.h

I have applied this set.  Thanks to eveyone involved in making this happen.

Mathieu

> 
> -- 
> 2.34.1
> 
