Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9B248873;
	Wed, 11 Mar 2026 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210024; cv=none; b=JIpLzckLqUi/HDZALMkU2sPjxJ17KTYiJVo3TvMAbSpP6vge9XAkoxrsilz2fyfpaaT/KpBHx3IOKLn2nsKnrIHWnD/EFYc4MWuz67r0980suNc1LmtPcKMqwfUpTk0oSQ5FlfRq40WwoHY9wqPr/1OZG1U3GMmppbUZ7Gg+wxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210024; c=relaxed/simple;
	bh=Jt7Eer3o58TSdYk2p57isN1LigDhSKGDvDBX+lSgCh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sylM+WdK2CohE8nqovD5Hi7mcrwTKgEAUIRJg2nq1kyI6aAbE0Vz5ooPv85eLJ/hGPF7MbI2BDJM5zyO91cYF6bCzxHavB5wLKWeU3IlEPKxqxd3xZ5xOArPMmIQXFZkMslrcv405L+rDflyylimoPyHmw19qPCs6I5Whd3Wt80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dqr+nlc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dqr+nlc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37BFC4CEF7;
	Wed, 11 Mar 2026 06:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210024;
	bh=Jt7Eer3o58TSdYk2p57isN1LigDhSKGDvDBX+lSgCh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dqr+nlc7VkoCVNN7RQkv2bT6TJKmH5xTGtK7HULxMq6Ixjlx4q0Lwvx92Fdc5Nhdt
	 C2lvog5MH4JAjHAnDHmg3E5n42UejrFt2iJb/ESZIdcZXtn60CrUwltqUVKtWtfssk
	 vfQ3AV+ze4IkVO/4aQFqqFs+YwoavD6wNi0CBf5T1JJQE5ugoEZh6s+fXp69y9Kgna
	 uKViWoYXIrnueVgoDZpSQMCPwxvTJUbJRMrV6hb9DNcNw5+Dm7llYEHRsQqfHgw01x
	 /7tlpkS90Yz2jw5PY/UD78TtbEqzo/JyNJcgRc2ybTonxmS5Oiq1FVg2MdlWCj99kZ
	 aGtrTg+Exnztw==
Date: Wed, 11 Mar 2026 07:20:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when
 doing rproc_add()
Message-ID: <20260311-glaring-belligerent-nuthatch-2e8ef3@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 03:03:21AM -0700, Jingyi Wang wrote:
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

Please trim your commit msg from irrelevant data, so this will be easier
to read.

Best regards,
Krzysztof

