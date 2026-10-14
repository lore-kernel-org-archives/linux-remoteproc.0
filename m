Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113D4A4EEC
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963923; cv=none; b=e6n2//Osd5dkzFpYDZdAXIbwdo3VMdG0DD2DHvnN5tUSnKix07TgZQkApD++Ss50Rs9rRjwFQrvG3HU8IwPxgX5U/cgeZQ2z8fd/xnEQV2Cp7tY0Y9EGeh83jMR/M4IN7Si2nGP/9MpSHaYYi6CK6HSxLkm+I50jT8aREx5nVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963923; c=relaxed/simple;
	bh=G7Y1mTh3qNjC4+O8QeH7eVT/l7nZq3JjRexKJ10DfVU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOQKs0sUA14ubrbwzrXQ7tb43Pvu7RHRd9N+0AqlhEn3tb0OwXnSfCncHhtQf3q2pl9+mLFDcwQpD/Dw840BJJ8xqlE7kinC18I9aHXPwoPwjbEQgcP3IQRv643Rrdq/TOZwp2Ndf01/Q+ylfrSg602COeyYwNILZskDg47rbgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3P+9RRx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3P+9RRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204F71F00898
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791963917;
	bh=l/FpzRk8OvMs4UIYb+x9OW+ScuaM5tcRGaQ0Q23ACaM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=S3P+9RRx7kw/ebSuEiefpKFTB02HH+YAFPenTIztDJScVlyTW75HArZctTgSsz5S8
	 yDf2pT1YJwkf2ZnEwxXJOYn6lcvYKFh8MYcL1S3mmmNFB5gm32dRJz6EPKedBgKpUZ
	 3zzVdwxJP46L4Yb1qSVqsE2c+lLVNI4slszZTkpin3D/AqQb+STBcm4F3NJcKicNMX
	 cXVMjefvrjsb9oFltJgvXMCAdF5OgjYfzi5m/hz+qoKtpWEGZdRTcNymZRIIYDWt3c
	 DcG0bZ3fMiZiA1wOAYMEBFPUNGDfB34uLVqcB7CF6HKLympuAmzi6WrLiUVFf6L+7A
	 Lp6Ob7XhpOrDQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so2898821e87.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 00:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3x0xNHjdCNoHWAhokgqQVhyDByMUnwwYFKj6r/AAOGnOkB4sCH6Iv5Elf2Hf1Rl/RNAF+j25WZuMmnjr7QUMj@vger.kernel.org
X-Gm-Message-State: AFq9FYKh2WBiQY0NpXefxz90UCVZ2m1lz971ltFld0yIvxDV1S08seBQ
	8vNpee4V06344sWWVa5C7to6JDPOdE7wzdwaY+9IcJksuZ9q+jTRna4tiv+X4lu8oTZUsI5WX0n
	8ojudQk75MxZAtJaWDf0DFhEjL2QOxgRNhGAZKyJTKA==
X-Received: by 2002:a05:6512:1593:b0:5ba:3e11:5d3f with SMTP id
 2adb3069b0e04-5bcde6d014bmr5149552e87.41.1791963915855; Wed, 14 Oct 2026
 00:45:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:45:14 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:45:14 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014070038.564879-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com> <20261014070038.564879-3-shengchao.guo@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 00:45:14 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me0i_jksGNhPOPzz6OAutN2DpSB6Sj9WgP1fCpB=LAt7g@mail.gmail.com>
X-Gm-Features: AclHuK_I8G0lpgwU229MTGckI_JLrdcikCxLnWPgGG9iLurfhbWwfZ_bLTZjmzM
Message-ID: <CAMRc=Me0i_jksGNhPOPzz6OAutN2DpSB6Sj9WgP1fCpB=LAt7g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 09:00:38 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:
>
>  - the subdevices are unprepared a second time by rproc_stop(), so SSR
>    and sysmon notifiers see a duplicate shutdown;
>  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
>    that rproc_attach() already released, e.g. iommu_unmap() on a
>    disabled domain for rproc->has_iommu;
>  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
>    "stop" via sysfs takes power to -1 and returns success without
>    stopping anything, so the remote stays running. A following "start"
>    then boots the firmware again on the running remote and fails to
>    re-add the still registered subdevices:
>
>   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
>   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
>   remoteproc remoteproc0: Boot failed: -17
>
> A crash found at attach time is no different from one reported by the
> fatal interrupt right after attaching. Factor the crash handling out of
> q6v5_fatal_interrupt() into qcom_q6v5_report_fatal(), which logs the
> SMEM crash reason, clears q6v5.running and reports the crash, and call
> it from qcom_pas_attach() before letting the attach succeed. The core
> completes the attach with balanced bookkeeping, and the crash handler
> then recovers the subsystem through the regular RPROC_ATTACHED ->
> RPROC_CRASHED path.  With running cleared, qcom_q6v5_request_stop() does
> not wait for a stop ack the dead remote cannot send, and handover_issued
> already prevents a spurious handover on stop.
>
> Assisted-by: LLM
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
