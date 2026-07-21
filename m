Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EFB443AAA
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675558; cv=none; b=VNmLXvM9M6v5/f4BurJOZ7TWhSIGfsMQ577mvWgX4G0oatK4CrCyUvEt03g3uFrAsz4FbhAxvOkfLh/xJpvxZPvrxk/1PrC3uhA66S2F3mDl7Rg1aXxGLhwNscHVoB+KWzwD61alQYomO/eg6x1zMfrz5+/I8NdNuyacyPlArKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675558; c=relaxed/simple;
	bh=E1xUp544mD8hGvP00uo8LYF6vpui1oe6A/h2MQI3tcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foRr6aLrrvC8lERbig1EnK+lTVZxjcbmFuN+ZU880iMbtNryKQNiRkFKzL3wbo71H9T3pbVwxXtCdtxolnydXmlmUBP33wmNSdQsRPAP9rG/XhFP0NzCq356M05NBIAw26Xtikmf6km5g+JD5m3VZstHX+yorZO2NXBrW9+kmaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyjhpNuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpzEF/OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyjhpNuQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpzEF/OJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZSsk2934590
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=; b=TyjhpNuQp9BpmM/V
	hfQs5MsNOrBW1VnKtfA0geUyje2hqOzgCxZOTVB14J8kQp2pNW0lnHztMhjd0miZ
	WUV0rQLcB2+sOlmqMFqUgOlXTKVtdWO+28SbCedt24QqSUtxq+Y9zQclgnwh+/Lk
	ZTysoWbUNMJpkiV4aMXq+5a8NYnx6S4vk+8blIndxvy9Lr/NnADPPRIPPewNHLCf
	0+EWoShyXWhhCpCCuXE1h2QYuCVcZvJ6ugfBE2ofp/zGdYVNY2/d97wstKGHK8+k
	COMstR8LkOw7eaBhk8wgzgfabf788U2GzvuUEYubL0TlKoVPzntmaILtLebPUmDJ
	YH/4lw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeamsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:12:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so286630111cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675555; x=1785280355; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=;
        b=CpzEF/OJpi2pVhyPFqSaRd2clSv+no9zjpxf82fdEcWRIEtZYwGL/wBE9rEWaHsiSH
         g4DYoyeq7SwVITyoVeqdkZcAslTD41RbfTz0QsMEFoXeav2NvXlvBwwrbGwOglSGcxsz
         IkzK8ZrKhGN/TWzh8OGG8gpKNATuWY+y+n2KhEJz+nq7JUm1rWcPclRWiFT0l3Fv9WZb
         NKhz60nzpXr4LQm7nIdo9FZ70KmmTqjZ9aZHr2i7ZtY5s1QEu108RDOUDuinKhkU0tlM
         2n6rGaVcplpYK+xospyMKcHJTutwVMR7QbNPGPjheu+5cUxlMiQVC6/FlwnAYjEWsao8
         YdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675555; x=1785280355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=;
        b=CEgjeSlqJ5pf1huEal+WU2X3Etu04SWCPZHxBIF6v9RD5pjnk0G5nGfx3CVzQ557S5
         ZamjxJgpBebJWOn1VnMkeM+iDL0m58ClDwAAe9u59miOJ2zt2Gqa+BPGgPWV5ZTfKo7s
         a06FzpYVaT4bZu2z1MDr7c/rSJtvDn3PdttINKpXNn6BXHHWvUBg6DV14/eHUW9miYVz
         bAt5Oc221WT3nqjROzfm6oCAzx1a3xo21K5IpyA6jfkwrUGhejXpk2T8aKtdfJpGqS3G
         1c/R8fhzdJ5LflsXSciiR8Zdq9Ht+POqfQvVdcli8AvagpWzBYQ/kzihIwo01KT4YXeB
         MgUg==
X-Forwarded-Encrypted: i=1; AHgh+RpFbJYUHgu1vK8EBcv6AQb7dApaOB6dODnq7uKSmBrJjwcwZzh5pa4o1xi8xkc1olOr0d9yQpNgvkj9TySA6I/7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XX+SwKIz8A9iO563jJVVh5QcLGiMG9uFiiow4b/MO8/dSet2
	L7g/C5ryshkCgJMrX41achZGrVGx7cAK0KXLHEwD4LwcyhxBZvNXaNRvhfp42iWzFivVqoC5YX6
	vhUTBywR9jRSiFMzpuyaU0KWgT/i+ViYT/XeXPBCdLFHp899aTjA/ZqQ90JY5MBTsrJ6NxFTu
X-Gm-Gg: AfdE7clPABcg5brqNJpvm98zcEwmAQIvrNfZIEONhJQXKojyXLSHG82wgCuxbpfkCbL
	wunUGP/UUgvLExrfnueSXy9ckQgSlLOCq6fuHxALLWocWY8snMguO/u+J+hMopE1wOb8JGP/XGl
	gHEC/qhF3IHkra9DkrK/9m2TxbFd7SDnpjnvFV84maAUYEFPE4daW8fopPtW54RUyXXF2Hw3ub1
	FlzP3QHiN+GbMpBUvkTQ1J9FX89sHm0XL409ftQnL8vKmCDBRd02e2AoYuBeoTYEz2C7aO9a49V
	CCcCMiRMMhNMVvsXszvyq1AUkL+e7mt5S+xAE2sEKMdcUv/CTgWHvdUffFFWoV51hIQ7svAvntB
	GqdJnHMxlHmlDBPtqVYWp/ADDrI/Xl5Ih7MqBnAGHNjrlkhW9FMHjfunxOmo4xwrMYXXfOaneAA
	ee9/0XmWafGAJS9g==
X-Received: by 2002:a05:622a:1e0d:b0:51c:7b11:41a8 with SMTP id d75a77b69052e-5213f959c7amr204206181cf.85.1784675554738;
        Tue, 21 Jul 2026 16:12:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0d:b0:51c:7b11:41a8 with SMTP id d75a77b69052e-5213f959c7amr204205581cf.85.1784675554256;
        Tue, 21 Jul 2026 16:12:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bafdf5sm155867e87.35.2026.07.21.16.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:12:32 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Message-ID: <wskpf27kmooybswypyzt2vcadh347rfzrd5mpjwrczjlxnsczb@hjlaoqbscupy>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mCxtqwO2jPCrUKUC94x8972kfM9XfY0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXySn/vx59kDmo
 T3yI/w+AuaizBRsmf5ft5E3N+T6apySt8BLiKF7UiLynNuDZnDHX6ipIoip8nDs/oXSdRH1GERc
 Dn3OPo89s1j/bQFfGnPS7mVVKLl1EV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX/m3h1LvzMc53
 oa0I3R4qrzHmjZEfBhggKSLzgKnpDV+EwqGxPGC8aULG33CkT+L0k2wnFuRa6WI6D2KvAlX6rYW
 827auUOfUL2CCjlmSZ2mnZ6O0GZfmbcd/h81M87tD1VVnX1B3bv82Xjwtnpqz1aPGMzVkxn8lsm
 2Ah0fJbhKu8hh9roZfRQYkvgsB9kWQOAVDAfn9oKm2DU9otSIJCNTpj9q9G+CpYvGRx6832jJSB
 eknNcjQGf2JwvoYXRdBW6ykIWujhcz1mbU+1JGOXfxyO0vs6VZVUvl9LPn/Tm4w2Mqyw7unPd5u
 Z7TZp0tYDllO1oyi6jOYiNSdJbm4SBDIPYWDVNCcJk0SSwFyf4uuWcZr901fzYhCj1RuI6Z2XpB
 VqUZFaRcsRdRXSUWIZjYxEvlRm3b4VvobpZ7zgwfvvZoBu7lroPhJJaeV0NDNEtkhxdKY9h9MYG
 JngXT2RHlg2wrkPxF4w==
X-Proofpoint-GUID: mCxtqwO2jPCrUKUC94x8972kfM9XfY0e
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5ffce3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:04AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
