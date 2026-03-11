Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994043C140C
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218393; cv=none; b=lqGJMW4fR6vKdX0GN5tLA0l3WVwA2Q7pn4cr+TMdq/wsOTG/Q0vHWddLqLWeKGpYKIi8Z25mmvAri+eBFlmyZ6XBf2yA66kq5esNavT+X5foZrJskwndIYVrniLo9owxkKjny+aV3R20lh+PIHWZOUFvi5TMk13Zpk/EbGGPvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218393; c=relaxed/simple;
	bh=QxbY4TmZVmcy5WyPXsY5uAywYWWbPj75/Fg7V925xEM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Klit+ZBxQVKdcIVZAvKBXH3+j/m2duicgK6CilS3NaVRSvagdnRf1YRn7Bmz4di7spnxXcasNwEy3cP6epQs5SXzspCCuxoWnuWsTVq2bY9pCbT4Cfc4Ee20cFwtvurvKa4rrc2hOsrE2MBEMDXjNHlzOL6Cgko7xw2HnJ2NkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJxEJaWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJxEJaWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13ACAC2BC86
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773218393;
	bh=QxbY4TmZVmcy5WyPXsY5uAywYWWbPj75/Fg7V925xEM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=tJxEJaWKKdrcw8kgcmla/CfmanmXOQ2IZvbxZPSLImcyVxGK+Ig/UvT66Sgfsimuz
	 SCvsdMJA6k8uoLRGEdRsfQuplHNMUvfbVD0CJOBZvYKDpi7sbm5xnM4On1meR3V74x
	 7Hx6AjvNbpC+WHCSyS9mRDv2Qy+VA6CJtv73RBVCpgFG6NI/kMVY8mnlQCYiATLnHK
	 BjUeYNxGBhY8ORevS8fHoML0x7mku1dBp8bNvxguG7OuwPTi+RXEfq81+P1wXY8jGo
	 p78vn7V7Oto7sV6Fa5YHlBfsxm2LcvPoeCQ/WMYwyAGRhjMdCd2rtsvO6l6DjqAtil
	 7lprrPM60IqPg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a1322af04fso7122413e87.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 01:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXE85WNSDvwzIWZWoYXJToRFTVt/LeA8BDBJB4kbh23ZBci5BC0FlHvonr0pOvf014mwfHrjf3S2BdppTwfj8Hx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1pWf3zgjeFF6yQX/d18SsdQqfOOjSpgTtaEbFYxPJbGV67aLs
	1WNkO70/XeRLPjlFvHZGOPIHewwe/6es9BZMLamdLyeYMlQWXRAx3sFDgu4zhOR+CI6SHOmI29l
	ScelSppkWmxPgsmWFbbXFpl+epmMi6InI2/Tg426R1Q==
X-Received: by 2002:a05:6512:b82:b0:5a1:3d08:cfae with SMTP id
 2adb3069b0e04-5a156bc0a56mr588182e87.22.1773218391674; Wed, 11 Mar 2026
 01:39:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:39:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:39:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com> <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
Date: Wed, 11 Mar 2026 01:39:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
X-Gm-Features: AaiRm50VFTJzB7IPYCS_UKzHDhcMPo2GrQD14UYX9HZQII94keloO5cakmoSMRE
Message-ID: <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing rproc_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>
>> Ideally things like this would be passed to the rproc core in some kind of a
>> config structure and only set when registration succeeds. This looks to me
>> like papering over the real issue and I think it's still racy as there's no
>> true synchronization.
>>
>> Wouldn't it be better to take rproc->lock for the entire duration of
>> rproc_add()? It's already initialized in rproc_alloc().
>
> It would still be racy as rproc_trigger_recovery() is called outside of
> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
> must explicitly call cancel_work_sync() on the crash_handler work (and
> any other work items that can be scheduled).
>

This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
but releases it right before calling inspecting rproc->recovery_disabled and
calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
lock and rptoc_trigger_recovery() should enforce it being taken before the
call.

Bart
