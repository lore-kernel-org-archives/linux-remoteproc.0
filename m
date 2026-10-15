Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84F50C280
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059146; cv=none; b=n264XBCAu+7JANTv3M9T+z0LugOljb/7IWyGrKkeHwF48OrXSga7t2C54vJhcvEbNt+Zv9h5P9cXUaSaT2ksHEyPU+c2oipS081ZUcWyJKSaKbDhw4GbEszdpaL0Zp4VAwXdGnQmdUKPtOvOrZSGeQzYvjtzksX/KqPoBCrHxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059146; c=relaxed/simple;
	bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ3lBoLJopRTyu26SjAHYLMxVfYsbnmwEMDYBrSKc7fqgBJ4YLKIzgXDh3TU3YHZ5em/H8FIwHFJgqUIkH9MYRHHnq0WYQTfy1B9d3ozmcIAb0lv/pH7aiJHkGTu5SbM02lai0EtPSdpK62hzP73xDWbg8WiJ1b4Y+eJYmJDtzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S64fWGTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcG0ibSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S64fWGTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcG0ibSJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZnL2966434
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=; b=S64fWGTZhKkuUcdF
	l55dEcT7II9eUe9EARbFSFHRFhqii+pPfEOQ1OLKXQ6zBEiZfdwAIHUxsUecpYIf
	ujgGbvusM34UgNNOztN5xoYpBC5SpDhqQ8weyaMmoZznPGafbn/EvFrdWRA4gH47
	lTz39aCbJ5j5Sljy1GJ+O3V23UR3i7JnK6SBFymVlDyuhbfHoqAIcgf3gYmFCPIM
	rMTxMrwv1G+oJDKQD/XmbVfXJWnmKmj2XyBgAqNJsEc4gYi06jvmJTv6lmhWImee
	H6FyRNbyz9USEpAIOlquAX9dTi0IDhwD2XCDmGXvVFrMHZuA912ohYN8SZz381F7
	II0wTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wugjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 10:12:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f12bb489aso4949685a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059144; x=1792663944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
        b=UcG0ibSJCLc8w4Radz2Z8glSkrf+BSKWh/P6wCN0Xk0PuSAqAH5Vv+ocUzFqpPW9bF
         bzn2TmBZ3F/8Q2+o+AguEj4or9vk+Qg/mJ3V9SoBgBUWJuQsMOWbgJTex+cTxw+KKZtC
         FLX5zbm5asV8rz0q1rvLbOu8ChmLdxv65qtvYRKgmYJHaYV3i8r/ElmusJP/rB1sg0FG
         sl216ei2PKZCV+viGOePzmTRcj1FzTFp4RVyHdXiFZkKF9RdS+r7RP3KHPCxXGSglNxN
         rNBbVjM0CrPBwCxj0VXO7bWKStuq+jXoEO7UzmVmXr3+y3+ANergFkNvn1tbksoVdmyB
         FjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059144; x=1792663944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
        b=inLzXePq7aPVJm911Hz732rHM9/C1zIM9S1cMWWIs7CJqZ2csso2fjy+CgFk2dVKLF
         DQQp9VAh26lAh+n425m9VEOhwQB01KCx7QXWFcwHv2sUQDGwjV8fTiZR/i9kY623NsVW
         Jjes8j+smI7ULVpZiC2zIvnCkTIKfXxWUO2rU3YgJM0G8NN8aFna9yQC6cFCUrLkS350
         sfUqaO5hvytQjTEPJ5dIDTv/HUv+ZbnPWNebB6UU0EeolIJJgi8J7y3npeiPUPQjIaRU
         10tC3O8xT+3UtqguWBU8vOT6FF2yOWHvHxeD3P+SXjRcHMJxW7mu6loCsR+6XtY0eqEc
         CEXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3q5dpjjB/jY01xkTs9W1+g2NKwOVzQQ//1PefysBmatssukwckLWN9vSI8Z0bNgBEDCeWHcbvDwlahie5zcwS@vger.kernel.org
X-Gm-Message-State: AFq9FYIh6eezWEgVXKOkFoHZ4WUsXQhMvI/78PG4qSvk3dIBb1TN6t+m
	ZIKMe9mTALX80YnYi49hXfUsNNZGCtBFQaZJxXEGzHxLnG7M+QhayIc4O6ghOhFiOucIiDe9jB/
	f7t1bFhffQ7nswxL6drsvjLI4V3QYMvozI+O+B5TFYdBdD69xqXSg1odBWUN/H+NoHAG01QC8jk
	u1Orm6
X-Gm-Gg: AYBFou2iIMdIrxeeZLcrcOSV94RWqu0be5adpVkS3z1Iq//+tIBSd5LcQu6Sk+R3iQX
	mRip0QgCKs0vn6+XUuGzS1uThw4pxETTVadlZS1E3ECa/ibqde5/Vs6jLC9Gl8HCVar7sWrRxIX
	lgvIa9MQUQGiKRYWIO8gv/xt0zu/j60p112R/zwH997oVbjwxtgo34l6IouxSdywowcM49Ja/iN
	y31K/TCUgvRdAFjSiJ2N5OUm/nSCq8A08xGewlrZONiumzP9GqoV8W4hbG+jTvMdtZt6X6GJ2iF
	rcB79cazHPquNqOqYqbBnQ5cQ+fBB4MOIGFHBaJM56k6ndbI/nWh2YnKWhbm271tnK6HZ2DEdQw
	Yig4EGkRyzKQRydumVzWl7w==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr693426985a.1.1792059143974;
        Thu, 15 Oct 2026 03:12:23 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr693423485a.1.1792059143491;
        Thu, 15 Oct 2026 03:12:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm105680366b.23.2026.10.15.03.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:12:21 -0700 (PDT)
Message-ID: <8a31549e-63f5-45ab-9dfb-59ef49cefe5b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
 <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX6IiWeL/Hn16t
 ZCxHOPV6UtOz2ys+bzyLve71iOVZtY/R6AinNoNvBU5vuQ8CwAGU/t1VrmIGu8gwa4RZ57X65S+
 /uNq8sWILqenS9O5i2IbdKC2JRngiM8=
X-Proofpoint-ORIG-GUID: 6n0Fk1CCuZ7DdS9AYcUZr8nrZdirgARR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfXzbnSjc5jKtp0
 sFvi/ECRAOgIT4j8YI/c2DUTWzXKFo75rGgAfQg/V6ILGcXbSMF0H/0Tlgg1cog30juoMQMUo/x
 ohHmMPd9Fx67xg/pGB5uInkK25pWEKWGc5klcbca+lFYbQ+l1gjsB4TD/w4DrfsKQMCviJIglOq
 tqv6dbJhgzrXHb/4nlLezpTCHnzxqyDghjm00bubTo1n0oTyys4k4ksIjXVnl7m/GNjZJi8AuBC
 h3r+mpPRZrmreFKlKKsLxi42da3IHevXISQzxMJ/4XAWGrFJx0YmdnLQDOiIqIWPWhjyyxP86tx
 L5OqcpizFpyDMViO+Yuu+FRcsvhGiwEawDkZhcAv1dquUxaFjZrDw52x5Ni2TeegywwiB1s5LKf
 U0FE57w90DQjhp6nZ5+ExON0r5m26qvPOvvII4CQnaPBquIGOZ0nppplKh2kRv2D5bCVp4o1JAw
 imFiQGz5tyjhhU+HwYw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a708 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KhYryj7Us4LvWG6v_dsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6n0Fk1CCuZ7DdS9AYcUZr8nrZdirgARR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150040

On 10/15/26 3:38 AM, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
