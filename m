Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EC12F6565
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933022; cv=none; b=eMVgIQzsdT9n8t/NQDQ4J5E6b+8NxtwEtzpmctIaa4pjCabpY6b40rvwRLl1Nqk3vZOj21DXVhzlQhyboY9dk5WImlh41D7xqnAkgDhz9Ox+GjfbfLUg7pr8O/l87h1NyTQ4tT+kjfCi8kMG8AOWxjhnIHPbWgYgIzNYJbU4ktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933022; c=relaxed/simple;
	bh=26L8P8+BYEfgtDM9IMVtZ8XjMX3ydx3e54JHbKTPo/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beIM57NF6F50ONsxPxKqr8P3adJdFtA+qO3Q1RuVqtnpbXnPYnMJFojB9HFRivZs1VOCJr46uApzixFodgU9lSAlc7xLUIqB1jLOS8VWn2+3VWFD6EBwce+iPD5o50lBcUhFEGXPByWcoeTVolO4kecWo8ZM6Gw3HHTNo958mWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jq1nGUj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDL9Av2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jq1nGUj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDL9Av2c"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvSb53372664
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 12:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=36wdWvLyo3ecAhggK8TtfuQ0
	lUUtEBp/lOfaL3Qwtfk=; b=Jq1nGUj1ZqEkbl0ePFqY3Y4XwqcNFxkCWn4JOCyO
	ogXlVj3BfW8DNZ7UloUNqn1uOwzm+aKzlClab35NAUyWsZiG/8+Uv/T+4TL1Ez+D
	9ABqn3LiGLsyhGl06WhK2/EHzKUYcEHcLaELUu79Wf5OjyWQZI70oBNfDQ9f2cSk
	mGxvaVsuyicUZZYOVeTlzGDXlAikULYqTlNcsATxqaF2/3qGAhaxkPOvjIplFZTJ
	wx+SiJdc2IzawclvchFOsp2pCYCq3cBCwBUTji9cHhZV5d7YVkoosE0iwdHdywrh
	Evq+WBpv3gfOKtU9T1viTaBt0pOz0AWoxhjYS2wAhKHScQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku34npu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 12:30:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso9294201cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785933019; x=1786537819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=36wdWvLyo3ecAhggK8TtfuQ0lUUtEBp/lOfaL3Qwtfk=;
        b=IDL9Av2cx0tBnqJi7pNfStQWQqqrCqbhKDlsNcLjKP0J8XFXOrlJWvE83UbYe3Z0GJ
         zvaVirEvH4EStKpPtgklB50vpE5bEk0MWdp1H0GvFNekoMv7GgPENwArIGbu3BpzW9NP
         XXIwBeBJ2wNAvz4Fp6ySePiEmHABVUjIfX3iwmlkSqCnjkW4N4z37dwQaLOZ0ou9ZKdN
         j8xu1SA7CA4Zkq2wHM6ZuPdYKQXzPDyIWpUbD0AIgJOlAkz1kuIONBTAcMWOUsK2XBj9
         qvdjz5BklXSwD3ihmvPmDEwMIbpAH3NamJMk3xLhgoqoD+1Dk9Dnsy2MN56cqZybXTWf
         WTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933019; x=1786537819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36wdWvLyo3ecAhggK8TtfuQ0lUUtEBp/lOfaL3Qwtfk=;
        b=pGsSJg1+owVfAtKtrmFIl8gRUob3zWNzlR3NqVi/JLDvijIaVsu+E+DSFW/8tvuS6I
         6cbNoADfmLuYItFvkwkHfHMcBD2mhQxliZv3+9J3VWhEyQEYqvIfj77KR6sO2LRJtZCI
         UyVPJA2o2DqVKZ7Ai5BgQ1k/cWs/6OmzJ0QB+RHLKGYiola8HGnaaK6H7XS+GHTtvvYI
         eFvYm+Q0L8hewxSfCzzPD6IFa1hIrjXoSTHm3y6Z3/D2LUrqWD2bZx7Q2yIeoqcqJvGO
         imEODuFGwqKvqHDywYwPnxQ9rIi2R8eVqLIDzzW1Y7ncem0MyFrponHYN/oaXiL9xSu2
         Iz5g==
X-Forwarded-Encrypted: i=1; AHgh+RrYE9/hOakRQRzS5CviKbAgWk1W7iX6cbp4KtZjmHh2fB55qX4HRbKF2YXgFDbEy3fzSA2gycIlUpWxKfwhCww9@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqxbpxVa9JShQ02dWblREbQaJTy5xfQJ+MFQMJHDtyvYHYQg7
	iCMu2Br3JX0gguGz3tCE6GyPqbEOZWkQWlp9OsuvN6cn7BKLS4LD50aa37NQE66f8oISrulhPN0
	OUHH1NTmcNyS4bdSGUYyJTGGJ2ArNG1o7ayMnaKC9PuPC6OilE4aej1GtcVUnpu+vcJHEadVj
X-Gm-Gg: AR+sD12VJtuWVU4A3Vz6RhkYmbM1j41aLSdG4bzH+TeE6NF90Ld3ixS4lisujeocNpl
	HUo/PRN0P1Tn7WHoAH4y39/bGT0r8vnwOn1WtUmkfjpIN1mlPJcqEVi6fzrt2+YztHD3IW596rm
	aZ7qgdnJ2uCJE5j257n+69UOvPS0zlCJ533Cs3SOftHK8er67D1FRtW3shLZFOK9oLci/OZZ2Ys
	XDy1QTgQrCxskp3exYbQVBL1DjG8yQIoKKu6Ad6WYIti78tKzviehg4dG14wvo9XoxyvCz+/uSq
	SzdmqDzscn/JdZcsJCD3MFrI4wikpeBelWt7AqGcZ0dy2Xq6sWOkCstxJBcwwxKOf2qim4G24KI
	=
X-Received: by 2002:a05:622a:54c:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52ce602d792mr61518891cf.17.1785933018523;
        Wed, 05 Aug 2026 05:30:18 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52ce602d792mr61517101cf.17.1785933017816;
        Wed, 05 Aug 2026 05:30:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm197681075e9.3.2026.08.05.05.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:30:16 -0700 (PDT)
Date: Wed, 5 Aug 2026 15:30:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom: q6v5_pas: Don't enable handover IRQ
 on attach
Message-ID: <frojqljzshyynx2ssoc273l26pavddvm4cyv7gt5y337osgjrk@ylpvj2sgquxq>
References: <20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: KUINsS-d2KOM5q5I6_TBX2-kj6EcSmQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMCBTYWx0ZWRfX45XnUl3+++n/
 PInDYRhdkSi+i0h6lwVB9Bm/M+BISXduHR7flNE4Q33ki+tsnFIhYqaABAOiq5oEV37YNkVqJOL
 jaM8HP3axWNk7TToAbH2tMIUtKDC1xE=
X-Proofpoint-ORIG-GUID: KUINsS-d2KOM5q5I6_TBX2-kj6EcSmQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMCBTYWx0ZWRfX/cDxGJ1hiWzQ
 hBUY2DhFqotlksbH4BRSUZ3IxF5tbk9fX3tC54jUuh8esRnbZLZBCpCGAc8J6xb2qjR8kTXBYxV
 YdgmnxPF79TwiSt2paOcvU1ZPaneu67z+ItZkwfxoenhGCd9qP/vaqk0smbrksT164ugjZxdi6L
 cd5FauSSFkDFhKnlqkwWMngGJkihcMkFy8NNn77KELnUxSuP/tP5MZZo6ZJ4D5l0T9XPCfzpdp8
 EHV/xCbTCxS7GYUsh3nuqySRPuabIVOtKtV9ZLK+h1QqwBpQt6aYoEXX6TyRwtExvq39cNcpI3d
 0At2NCitqQtWt4wyzaUNdxgeMTtJTEMW9iqjG8A62r05QHLdV46GhOtF9ZNuQaBqZz0qF83W5+X
 RAN242ozN9nkrfk+HvXyAH9fO+7ytT+Su3qGggN9raPsyGCYU3yxTSiLP0tW8hhz1zUJU5xPUuv
 pCbUUOshpff6RKLEMnw==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a732cdb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7Ii4lnSLsnmGcvS8eW8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050100

On 26-08-01 09:17:31, Shawn Guo wrote:
> qcom_pas_attach() unmasks the handover IRQ and marks handover_issued
> even though this driver instance never runs qcom_q6v5_prepare() for
> the boot it is attaching to. This was believed necessary to flush a
> stale interrupt latched at the interrupt controller while masked, but
> the handover IRQ is a Qualcomm SMP2P soft IRQ, not a real edge-latched
> hardware interrupt. The Linux SMP2P driver updates its cached value
> unconditionally on every notification and only delivers the nested IRQ
> for bits currently enabled in its own software bitmap, so a transition
> that happens while masked is simply dropped, never replayed on a later
> unmask.
> 
> Since there is nothing to flush, and this driver instance never takes
> the proxy power-domain/clock/regulator votes that the handover
> callback would tear down, there is no need to unmask the IRQ in
> attach() at all. Drop the enable_irq()/disable_irq() pair; setting
> handover_issued = true is sufficient to keep the flag consistent for
> the eventual qcom_q6v5_unprepare()/qcom_q6v5_prepare() cycle.
> 
> It fixes the following unbalanced runtime PM usage and IRQ enable
> warnings seen on Nord ADSP (probed as attached), after commit bb7c5d6f5b41
> ("remoteproc: qcom: q6v5: Make handover IRQ one-shot") comes in place.
> 
> root@iq10-rrd:~# cat /sys/class/remoteproc/remoteproc0/state
> attached
> root@iq10-rrd:~# echo stop > /sys/class/remoteproc/remoteproc0/state
> [   40.004874] genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
> [   40.012409] genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> [   40.050074] remoteproc remoteproc0: stopped remote processor adsp
> root@iq10-rrd:~# echo start > /sys/class/remoteproc/remoteproc0/state
> [   44.350298] remoteproc remoteproc0: powering up adsp
> [   44.375769] remoteproc remoteproc0: Booting fw image qcom/nord/adsp.mbn, size 8241816
> [   44.389850] PDM: no support for the platform, userspace daemon might be required.
> [   44.397864] ------------[ cut here ]------------
> [   44.402633] Unbalanced enable for IRQ 363
> [   44.406779] WARNING: kernel/irq/manage.c:775 at __enable_irq+0x4c/0x7c, CPU#9: sh/791
> ...
> 
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Thanks for fixing this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
