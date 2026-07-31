Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63D0305679
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461757; cv=none; b=eCDv7dvs8KdFN9SoRl2PecGqqEybvRZxtrT6VVw7HqLT5J5mOGiAQdiF66JF2lMVnBhzQLrhqHPstUJPKi9dv72WQeSar8DNRxo7+AAwIQ+HPR75bGztTV0V9ORr9QMd1LBiN7nLLlQF7F8Zz29A1WYCUAWqURD2nTUCR8DOP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461757; c=relaxed/simple;
	bh=A+rSUlKW8VcWRMaDGydQ5TuAXApKjxHJJ0nW5umVDxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmuAQypbjbk+beKetvPbrhG1o1YFmo+P9mcWqgHbhI4xP1U0hkHPUmHlfZ1ZYorJrnkc3rDfw6ybjQIy63Dw7+hWGlD9ICTVZ28ywvniCaQk0FRsmwzb9E4DPhbmtGMaC0PTewlVug3JRn+6wvfJYQSRYcUq0cH0gg0ENOfJA7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5ksD7PP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV2irXKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5ksD7PP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV2irXKT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrZfL2457846
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 01:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xeqqz9p0C7euMHvXgxQjb2By
	cTgH02YLsKLYSF3E/BY=; b=A5ksD7PPuQiFs8kD7RBGLrr0/p7Z/y5gXbCuMWe4
	9WHA7NdboHUFaiZlPU1x/sZ4lNFYroVnVWf2Nz75dbtOu3S3Zzp+q7eYdC/Y15gP
	EcXzg7VbJRQG8w/QbUII3id0gYsRuWkFmXVa2pep3akWfTOH4Ia1zegz8Vtp9TL7
	BbhO6xXYlJsJE3WJGx/NOfLKNtWCjkIsnwxi9JocHHzFI43c64/O3rapWvS4gigI
	aoGBSzsnF+DWbN1OMH3NBpQknzJHj8GivKbz79Ktp+eiKydkJbr/PLr6ed/X4ysC
	1jwZmByxtM1HlVJGGUJKPfp+inm266xdN3BFR8leP9NzfA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frf0wgh9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 01:35:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so301572a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 18:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785461753; x=1786066553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xeqqz9p0C7euMHvXgxQjb2BycTgH02YLsKLYSF3E/BY=;
        b=GV2irXKT+IxKW0BbFHlRHaVhHOysJmYW4ehzhRypuoPFTBFuDv9hcCQKKLAJErbcem
         dkknUPsqe0Q1z8AzR5sxYSQ1WaMg4CuOwNyTiMGSmPqXaGTBpjm1wNvMH7EhBjxsUorK
         CkgP0qIqQNlyZ1h8bZ1EzN+pQlPSoNvrATydLnjgbKCc5mJauO6OsH3+j37R2LhgkzRV
         gIFMVoqt8WTlzjhtJIx188Cvlb4/tMhxAwoENL6hnLFKg9+dT0ZQsDvSUaxvVuHSj3o/
         yiBmzxSGkcPvTU9SDYGORTvRLplSGD8843THdb0l99RUUHsvSVNFhFudZS4+bSXDdd8p
         138g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785461753; x=1786066553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xeqqz9p0C7euMHvXgxQjb2BycTgH02YLsKLYSF3E/BY=;
        b=P/pPATUUN1g1qZo9bEPNZWWIHE3GITOXgI0GAEPzkUXXHJMc9/7fNhkSG0jYHKN7J8
         3T3VW99V/XbpA+rDOU86SFJyZWmMONyqy0wDVoTZoHlTLHCyzr7rPzhhnw/w5e1J7b9c
         oGim5E6HGORwk9bdPQty19pExhuZh+6l2UhwXeCZoEI9YIaHpcSJ5XFb/VNstx2RcdZc
         2C/Gj9mgiyJyUxqzhFp7zBt1UPXuHYMWEVa6aME/tTvJGQ4+Mp/n88umuABeIQH036tV
         NuOLert+qWd5w2QHIK8kW/u4NlxptyLPuYgEECniXPMr2hE/W5dg3pIKhN9HprUlQk/F
         cYIA==
X-Forwarded-Encrypted: i=1; AHgh+RpmrncRfid0+csurY/jhXdgXnvUaEnYIfnoDnEFhITvRt8pm9bro2+VzSw25xDhIZq6oefwGmvh9VRI3tWydRzR@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVdAhSQBXubWURpaVYtKn+ZDt3nHxldrWU30O8zCtA7/g2872
	vVttGxUNXGM9HHwzfrAI8cf8YIzuQv6kvoPzBfVIp5v6SDKNPfdvobQZk08kMd51PTsrUcHLASn
	+2NfS5RgmEsqZoALmqqu1mH5U9pZj4nrSiHuW71jSxhvknzCBsBpCclu5/Q6FQ2waj9DdVnqQ
X-Gm-Gg: AR+sD11GD9QeG6zPmrLQJ7N8/7EsLDGIaew5Z9oyIaog7VaPnTqQ9+dcXJ9BUYRWPHt
	3FG7VQmqQgdYA9yN5db4G1H5P/SgAlQcWJY5xviEv/wNOHArNt3tmbk1CrW87bbkFEUd8/cTZ4+
	oVU9QrgFpANkkvzRStidpBCo+YSNPz97MJxJI+XTqQE1oIO8zZ1GqjlbxT1/F4a7RHsYGy+bbMv
	C4qWbeAcP8rGoK48YYoTx1Fih1whMAqNiC/cong7X/kDUUgcQvOue02kl61eoCe7xBSYBU2s8dG
	QxRXlpzzGwBw3VD4zD2H8QiVZtQmc7TheG2JutDXnKymcBQ/2sIVFaZn+Jo/PiwHmtIaD+SOOp9
	Othjoi8r/VeLVlZfpNMBoaVH6BrgfulE+Vz+C818AENs=
X-Received: by 2002:a05:6300:67c8:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c900a2f8bdmr4721473637.76.1785461752862;
        Thu, 30 Jul 2026 18:35:52 -0700 (PDT)
X-Received: by 2002:a05:6300:67c8:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c900a2f8bdmr4721448637.76.1785461752409;
        Thu, 30 Jul 2026 18:35:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ae94d98sm361227eec.20.2026.07.30.18.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:35:52 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:35:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Make handover IRQ one-shot
Message-ID: <amv781piw4R6txhF@QCOM-aGQu4IUr3Y>
References: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwNyBTYWx0ZWRfX4kAwIQZZpZkj
 SeNB/ZXaCVvTx1/vyDYMF5YsbfL7YeieU5xmw5IXArjTiwHIl8WSY0Oo3XL6eL+M3fa8kwQZOlm
 SP4whwFLiEReBQNmX1CAGOYrw/0ksEc=
X-Authority-Analysis: v=2.4 cv=T928ifKQ c=1 sm=1 tr=0 ts=6a6bfbf9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CaiisS-sbLJf9WzfOOcA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: eOsvVV_erPsMGbi0N0JPFDzBjp-hyc42
X-Proofpoint-ORIG-GUID: eOsvVV_erPsMGbi0N0JPFDzBjp-hyc42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwNyBTYWx0ZWRfXwWv5gnzIXkJc
 mo4Lg4A8ekbusF2OgMfkWOylqzfJEx05CFkgKA0k5D6xAWEA6mMgQxj5auVX4/i3L5lc2QWrJdA
 RrSiHHBfMfNyZRfmVGgRr7AMKS7mzR9wDGS3ht3K77BuChe89qWf0qsrjso5Ns2ahRXM6kS4VpS
 v6ypDK/HDhIGeD7dzYcF/s1h6hrCcSKoY+KRmw8pFZLQRR/s16iWdcX+GTaVxRG7r/P4Bnn2sQQ
 cxxMxOnXCAn0CujDBLuhOOPN2BaDUrz3UNMv0sIOyBRMXiOwXfjdhFMI13dIFVS+hvxf5yj6GBV
 eh+0iEwTkBFvudPKKK564lH9ovOfi4mugjtGQ8ygyiJj6QrkDLd1KamFrxPVQMjzSIiRWy0Xlzr
 Ull7a9XlFy0YK5uae1+NTnUtuGt+j82b2790eKqLRON6217wGBcxfUbXOobFKQIN2Vh6WdklpYq
 2vJP69Zylgu+WkWEZmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310007

On Fri, Jun 12, 2026 at 02:09:08PM +0300, Abel Vesa wrote:
> The handover interrupt is expected to be consumed once during each prepare
> cycle. If the remote processor keeps signalling handover after the first
> event, qcom_q6v5 currently logs the duplicate interrupt repeatedly while
> leaving the IRQ enabled.
> 
> Track the handover IRQ enable state explicitly and route all handover IRQ
> enable/disable operations through idempotent helpers. Request the handover
> IRQ with IRQF_NO_AUTOEN so it is only enabled through the helper during
> prepare. The handover handler disables it after marking handover as issued,
> while unprepare disables and synchronizes it before checking whether
> handover was issued.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 54 ++++++++++++++++++++++++++++++++++--------
>  drivers/remoteproc/qcom_q6v5.h |  4 ++++
>  2 files changed, 48 insertions(+), 10 deletions(-)

I seem to see a "regression" on Nord ADSP (probed as attached) with this change.

Before the change:

root@iq10-rrd:~# cat /sys/class/remoteproc/remoteproc0/state
attached
root@iq10-rrd:~# echo stop > /sys/class/remoteproc/remoteproc0/state
[   28.005204] qcom_q6v5_pas 4c00000.remoteproc: Handover signaled, but it already happened
[   28.036754] remoteproc remoteproc0: stopped remote processor adsp
root@iq10-rrd:~# echo start > /sys/class/remoteproc/remoteproc0/state
[   33.603101] remoteproc remoteproc0: powering up adsp
[   33.626128] remoteproc remoteproc0: Booting fw image qcom/nord/adsp.mbn, size 8241816
[   33.640317] PDM: no support for the platform, userspace daemon might be required.
[   33.724070] remoteproc remoteproc0: remote processor adsp is now up

After the change:

root@iq10-rrd:~# cat /sys/class/remoteproc/remoteproc0/state
attached
root@iq10-rrd:~# echo stop > /sys/class/remoteproc/remoteproc0/state
[   40.004874] genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
[   40.012409] genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
[   40.050074] remoteproc remoteproc0: stopped remote processor adsp
root@iq10-rrd:~# echo start > /sys/class/remoteproc/remoteproc0/state
[   44.350298] remoteproc remoteproc0: powering up adsp
[   44.375769] remoteproc remoteproc0: Booting fw image qcom/nord/adsp.mbn, size 8241816
[   44.389850] PDM: no support for the platform, userspace daemon might be required.
[   44.397864] ------------[ cut here ]------------
[   44.402633] Unbalanced enable for IRQ 363
[   44.406779] WARNING: kernel/irq/manage.c:775 at __enable_irq+0x4c/0x7c, CPU#9: sh/791
[   44.414837] Modules linked in: bluetooth ecdh_generic kpp ecc usb_f_fs libcomposite qcom_pd_mapper rpmsg_ctrl fastrpc rpmsg_char qrtr_smd qcom_pdr_msg qrtr qcom_q6v5_pas qcom_pil_info rtc_rv8803 phy_nxp_ptn3222 qcom_q6v5 phy_qcom_qmp_combo qcom_sysmon aux_bridge qcom_common i2c_qcom_geni spi_geni_qcom drm_kms_helper qcom_glink_smem typec mdt_loader qmi_helpers phy_snps_eusb2 qcom_cpucp_mbox qcom_wdt qcom_rng socinfo qcomtee cfg80211 rfkill fuse drm backlight
[   44.456498] CPU: 9 UID: 0 PID: 791 Comm: sh Not tainted 7.2.0-rc5-next-20260729+ #114 PREEMPT
[   44.465363] Hardware name: Qualcomm Technologies, Inc. IQ10 RRD (DT)
[   44.471910] pstate: 614000c5 (nZCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   44.479075] pc : __enable_irq+0x4c/0x7c
[   44.483043] lr : __enable_irq+0x4c/0x7c
[   44.487010] sp : ffff80008688bae0
[   44.490434] x29: ffff80008688bae0 x28: ffff00080bf1d000 x27: ffff000806285528
[   44.497784] x26: ffff000806285000 x25: ffff0008136ac600 x24: ffff0008136ac440
[   44.505134] x23: ffff000806285518 x22: 0000000000000001 x21: 0000000000000000
[   44.512485] x20: 000000000000016b x19: ffff00080c8e1000 x18: 0000000000000006
[   44.519835] x17: 0000000000000018 x16: ffffd80886bb74b4 x15: ffff80008688b4f0
[   44.527185] x14: 0000000000000000 x13: ffff008f3874c000 x12: 00000000000002fa
[   44.534536] x11: 00000000000008ee x10: ffff008f387fc000 x9 : ffff008f3874c000
[   44.541887] x8 : 3fffffffffffdfff x7 : ffff008f387fc000 x6 : bfffffffffffe000
[   44.549238] x5 : ffff008f3891a188 x4 : 0000000000000000 x3 : ffff2886b057d000
[   44.556589] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00080bf1d000
[   44.563939] Call trace:
[   44.566485]  __enable_irq+0x4c/0x7c (P)
[   44.570454]  enable_irq+0x6c/0xd8
[   44.573879]  qcom_q6v5_prepare+0xb8/0x118 [qcom_q6v5]
[   44.579087]  qcom_pas_start+0x30/0x418 [qcom_q6v5_pas]
[   44.584392]  rproc_start+0x88/0x1b8
[   44.588004]  rproc_boot+0x194/0x3b4
[   44.591613]  state_store+0x40/0x104
[   44.595220]  dev_attr_store+0x18/0x2c
[   44.599006]  sysfs_kf_write+0x7c/0x94
[   44.602792]  kernfs_fop_write_iter+0x130/0x1dc
[   44.607379]  vfs_write+0x240/0x370
[   44.610906]  ksys_write+0x70/0x108
[   44.614430]  __arm64_sys_write+0x1c/0x28
[   44.618486]  invoke_syscall+0x54/0x10c
[   44.622370]  el0_svc_common.constprop.0+0x40/0xe0
[   44.627228]  do_el0_svc+0x1c/0x28
[   44.630655]  el0_svc+0x38/0x1d0
[   44.633908]  el0t_64_sync_handler+0xa0/0xe4
[   44.638233]  el0t_64_sync+0x198/0x19c
[   44.642025] ---[ end trace 0000000000000000 ]---
[   44.708474] remoteproc remoteproc0: remote processor adsp is now up

Shawn
