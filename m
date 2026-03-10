Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321CA29B78D
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150635; cv=none; b=LfExct/k1aaZq1wxwX5eTWrBFFt5PrP+rDwYgfmFRn/FsxQvkZALx0Kur0klGheQ7cNs0I0v0gSQUpHwUnn99bVKkLKUl9xO+CYEmqX+zdvGX2HdoeWrB9t5tjf0eAOGgkzS7z9krvf3+SFNrGNq+sbA4PBrs59hBGjppnl4WzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150635; c=relaxed/simple;
	bh=rdUiPy2+hha7jKHz5R0tb6oJs3+2mZ0mZsIaAo22UjU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxQpX5dR5mfj2IY//kumxxHz79Bz+0362KtXQ00yOoUpywgVvjovpwXDqHHBvilxX/e+rHAKyUD6N4ZDeo5d0Jt79a37pp8KIrxEG/P1k8g1AK6UORujGD7vhpuF85/B4bqctkrv97a2Ygcj/dVIjQmdU2UzFU7203XHYkcx5Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iD+BDVLW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iD+BDVLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE18FC2BC9E
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773150634;
	bh=rdUiPy2+hha7jKHz5R0tb6oJs3+2mZ0mZsIaAo22UjU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=iD+BDVLWIM5gKelp2lGniBHdneqFnctQ0qYo7K1X9zPLp66DY5DHC4xuWI7WHO50U
	 vWKzA277e9alpN1wcHs2R1vBK0HKiKGTGcq8WfsCinZXjfr/5X8GjZCUBunjVRRQSY
	 a4DNTnGlkQoswt7IYAkhDzemA7+HbZEheA+Mn6bDNhABrGlTFDdd87FUb+A+Ram23p
	 8bdBLr7GNiRCmu11HjcKR0Z5J+vjFj4OPmHHyL7G0GGNfVCXVTbt0/DF91l+5N/5EQ
	 hJbns3TXj0nX63YsdGswa6KLeeLcURu6YjMlO0OMUDZlnGXyNsG++ytHI913nwM1S4
	 JEcK3yImCpLZw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so7381236e87.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 06:50:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRnaRY9kOj/YCEq4AxnYCQ+XEz0LdLOt0ojVmieL371NwymlfoOSIFfhTsa/V7p1HAH1wCbsOCLm38ULUI4TDp@vger.kernel.org
X-Gm-Message-State: AOJu0YyAaOAj/UZL/7R7oqscvlRxK/wRTWthiv809OgnoZKLIFbhhWbA
	Qth5z4l/Bi7j3syPrQLuD8cE+5Muz5mb8HxmM+dGb2kFcBP4ERaTVpaeeW2dZ8KFUIL0V7HFsvl
	x0rrMNK75rUG3NEAtPTaQjwoY4vucbK/UrSrKq/h1dQ==
X-Received: by 2002:a05:6512:32ca:b0:5a1:2efb:917f with SMTP id
 2adb3069b0e04-5a13caae6ccmr4333373e87.4.1773150633351; Tue, 10 Mar 2026
 06:50:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 06:50:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 06:50:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com> <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 06:50:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
X-Gm-Features: AaiRm51ARcqlsmU2wIb7NleLQsLhCnonv2nK6lkxB23KnfmtQ9OYSi2lSUj0KNE
Message-ID: <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing rproc_add()
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 11:03:21 +0100, Jingyi Wang
<jingyi.wang@oss.qualcomm.com> said:
> rproc_add() called by rproc probe function failure will tear down all
> the resources including do device_del() and remove subdev etc. If
> rproc_report_crash() is called in this path, the rproc_crash_handler_work
> could be excuted asynchronously, rproc_boot_recovery()->rproc_stop() will
> be called with recovery enabled, which may cause NULL pointer dereference
> if the resource has already been cleaned up.
>
> [    5.251483] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
> [    5.260499] Mem abort info:
> [    5.263384]   ESR = 0x0000000096000006
> [    5.267248]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    5.272711]   SET = 0, FnV = 0
> [    5.275865]   EA = 0, S1PTW = 0
> [    5.279106]   FSC = 0x06: level 2 translation fault
> [    5.284125] Data abort info:
> [    5.287101]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> [    5.292742]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    5.297939]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    5.303400] user pgtable: 4k pages, 48-bit VAs, pgdp=000000089e086000
> [    5.310022] [0000000000000300] pgd=080000089e087403, p4d=080000089e087403, pud=080000089e088403, pmd=0000000000000000
> [    5.320917] Internal error: Oops: 0000000096000006 [#1]  SMP
> [    5.392494] Hardware name: Qualcomm Technologies, Inc. Kaanapali QRD (DT)
> [    5.399466] Workqueue: rproc_recovery_wq rproc_crash_handler_work
> [    5.405729] pstate: 23400005 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> [    5.412879] pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
> [    5.419674] lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
> [    5.425308] sp : ffff800080ffbc90
> [    5.428724] x29: ffff800080ffbc90 x28: ffff00081be833f0 x27: ffff000800059c00
> [    5.436053] x26: 0000000000000000 x25: ffff000800a56f80 x24: 61c8864680b583eb
> [    5.443384] x23: ffff00081be83038 x22: 0000000000000001 x21: ffff00081be83000
> [    5.450714] x20: ffff00081be833c0 x19: 0000000000000000 x18: 0000000000000010
> [    5.458043] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0008042684f8
> [    5.465374] x14: 00000000000002dd x13: ffff0008042684f8 x12: ffffd37f69f967a0
> [    5.472705] x11: ffffd37f6a006800 x10: ffffd37f69fee7c0 x9 : ffffd37f69fee818
> [    5.480036] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
> [    5.487366] x5 : ffff000d6536d408 x4 : 0000000000000001 x3 : 0000000000000000
> [    5.494697] x2 : ffffd37f5703c18c x1 : 0000000000000001 x0 : 0000000000000000
> [    5.502028] Call trace:
> [    5.504549]  qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
> [    5.511344]  glink_subdev_stop+0x1c/0x30 [qcom_common]
> [    5.516622]  rproc_stop+0x58/0x17c
> [    5.520127]  rproc_trigger_recovery+0xb0/0x150
> [    5.524693]  rproc_crash_handler_work+0xa4/0xc4
> [    5.529346]  process_scheduled_works+0x18c/0x2d8
> [    5.534092]  worker_thread+0x144/0x280
> [    5.537952]  kthread+0x124/0x138
> [    5.541280]  ret_from_fork+0x10/0x20
> [    5.544965] Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
> [    5.551224] ---[ end trace 0000000000000000 ]---
>
> So set recovery_disabled during rproc_add().
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b087ed21858a..f66dde712cec 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2286,7 +2286,10 @@ int rproc_add(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> +	bool rproc_recovery_save;
>
> +	rproc_recovery_save  = rproc->recovery_disabled;
> +	rproc->recovery_disabled = true;
>  	ret = rproc_validate(rproc);
>  	if (ret < 0)
>  		return ret;
> @@ -2319,6 +2322,7 @@ int rproc_add(struct rproc *rproc)
>  	list_add_rcu(&rproc->node, &rproc_list);
>  	mutex_unlock(&rproc_list_mutex);
>
> +	rproc->recovery_disabled = rproc_recovery_save;
>  	return 0;
>
>  rproc_remove_dev:
>
> --
> 2.25.1
>
>

Ideally things like this would be passed to the rproc core in some kind of a
config structure and only set when registration succeeds. This looks to me
like papering over the real issue and I think it's still racy as there's no
true synchronization.

Wouldn't it be better to take rproc->lock for the entire duration of
rproc_add()? It's already initialized in rproc_alloc().

Bart
