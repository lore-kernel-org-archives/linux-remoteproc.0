Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5314302ED
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356981; cv=none; b=QdeSRXAfKjM8PzMsmgVDDuyEZml4yKNHgBk7b6tA3DR7d1lD1VTohDgNa2KrHaF/rRUqyXwaAW2eoLZRJ4elHIoCyhQmpu+ExQyEOpWXZGkc8ptl+lnG4q6WfhbpfEGb+v2Iw3bvQem8y2iUcgLwK1ovn29LLF4A2sXs93RfoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356981; c=relaxed/simple;
	bh=YPdQLfh2RGtydB69KJdhfCi19vfJppne01VG0Q+/MPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRFycz5lfdMU5NoDhfdpe4zq14/1l4C++leBjmTEFP505dH0AWoXLIAB9mY1Yf2X0w7CWHzNzzIVYgTPYLAeeGNLhDcceZg+bTPI7tTwoa0EzH9MDUTKuHRtAbEFlYHsdtDcPbJ41cwPU3QU0Adu+Wi75eoh3EM26D/ZhRzOoFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbOsUwwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzIAUPbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbOsUwwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzIAUPbu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDkM762353
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 16:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8gzFSFSvjnPKB6Lm3r8Nc/vR
	UdIbPEiJv8R7RlG9QqI=; b=jbOsUwwhsBRHzhjmNFd51T98T5IVCqZkBgZBVC/I
	0xEconIg6nzb43xHg/+eL63HJ4GCzTJTPsCw2+5Il+XwIVxrz0utZuZ40OBDZg91
	YrkUa+Qpf6lfbLM3WB8UMNSQtqBj3S7gIgnkrTl0IkRYoBBnS5KfylZLqOZsFfbc
	C/AuJZhtPfynXZmyuD2D3venbWNlpp3f91ZPwdmFBYLj4oqEJquLhHA/nob9hfv5
	oyL7/NlMThRGYgyorbnwcqgZxjIi/kB5oL2r+VppUkfwodmXTQwptUBoaitnyBF1
	Z4HplXhyZYQCzljJ/f262Omj8VGVyiKckGi3brfeLKYyQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 16:56:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91ed0e140c5so589092885a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783356979; x=1783961779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gzFSFSvjnPKB6Lm3r8Nc/vRUdIbPEiJv8R7RlG9QqI=;
        b=LzIAUPbuWkb/AVny2I77MfPa7uW+Ms2v3JbOP2IAR/6ecXsE2a8PDjXw2Ns9yEZY1g
         7YBemussmRL8iOEsxFi3nDh20YfIR7HaG0ajGtOP6aQEKMkCSPkzMXErG8LfHv+TeN61
         GaE1QeU/CEbE59xFShpIiNjzoI57Cq1+nnhbF6Y8E+YZtvu65x2heWosKoAWnhDFB1bL
         756PlHpogjMm+41ZDLfgfNYeBrp8xkUWerBeL/8MWk2xsO75qICCBKUjjJJYmK7rMxNc
         O8opzjjr5M7ZKh5gzK6nYqt0zQ7uHtmZx5BC4fN4lB3Qx6PVeMw/aaZ2DY/Eht/NEdBW
         /VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356979; x=1783961779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gzFSFSvjnPKB6Lm3r8Nc/vRUdIbPEiJv8R7RlG9QqI=;
        b=KIsoLPj9S7eeIlN50JDJAxbuoMel2nLtWYGv9eaFB0b464yKLQWGbodQIurPNEPdjp
         1epSLVoxf1ecbmCAiqUMH1gvBQ/gHj+a3StqZTD+U/dE427BwUjdb3Qv5micKL2Ooczn
         65F28yi1AvWOx+439GHoLd2FOn06yP5VFfww/zdXeMkAX+uUyicPn+EZwq48ZL7m1ZJi
         J0s3a5qwKN/mU9r1btEFOJ10f389vmhTIL6yxcL+CRRpwRRFH619/rT3ndpRyWGUJ81P
         C2OfDQ283npZ/WPM+CQuPEaYl9B5NSe/J06eSN9WNiFt58KKssZPEVTAOtFeof9Q00Z8
         S+2w==
X-Forwarded-Encrypted: i=1; AHgh+RobKW53vBRab33uEcs/WSk9tikl/ghF5wtsxrC6wNOiLHUOyrPV9yhz44oQ2SoHQD+k6GWXs2f/Ay+k2iLRFOXi@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZ/p9qOgo5sdPHTkp+9S4A2syEaqQh0iUhkWBqGFO+1Q01RVn
	ydPhYMNvBOdrB+berCY4g2s0xSFaNNLnzDzZzgFs8pDZcjDzJ6nm6Xm6S+2rOuPyGV6Q4AxDtYb
	3UCUyut4HAEa5UgoWFtuY7e1p26nrqBirB4+WYG33FKfRFwgR1hMTNotzVdydGotFKtuLL0xi
X-Gm-Gg: AfdE7clFnlXoQqPHBHMUwrgJPxcRe7ifdRuH5OFJDo6LB/kTHaiylarQRQEMn12RAnU
	Q6dSwZDMmTQnzT+8RpsOKTbaSwyfr872Ka9qsIucwB7lKN5N8mV0K/lT9+l7xKSL52Gzmq4OuuU
	zeY+ZNyJWqmLbiN8vgVWzCcekZXG3xKF9DjOY0KoSClnjLBm5k9N1DQiP9ek0I96kKhCb7gBXP2
	IbMHUMrkhjJX3pI8YYuJVwK0h6otQKENdIudh4NjaSIB3gBsXL4UV8i/ZWvgp6PsByihvSDgVU9
	6K3EbC9AnZFPqUUSANK3kjtOFV4eCEMPTX+H0iIQHcvubFnnQRrCodqmj9C9aH/TfhG4RcGXLzD
	JHHFBpAvcRVI2rYmzj7o12LODlhqA4NrK0mD33yOQEXyfYgj9HobdEcm8Q1A4sXucWQG6QbdMbi
	HDNW10z4hkr3dsEfiKN+2jktwB
X-Received: by 2002:a05:620a:470a:b0:914:cb07:447e with SMTP id af79cd13be357-92ebb4b43b5mr205833685a.5.1783356978594;
        Mon, 06 Jul 2026 09:56:18 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:914:cb07:447e with SMTP id af79cd13be357-92ebb4b43b5mr205807385a.5.1783356975432;
        Mon, 06 Jul 2026 09:56:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae5c8ecsm19519561fa.35.2026.07.06.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:12 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:56:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id
 configurable per platform
Message-ID: <ftjlwqifp5drxvn3d6bsr6ldqrsva3rpv527fz3kjyxzylj7gq@ex7w7imyp5wz>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
X-Proofpoint-ORIG-GUID: mv9p8fViasiLUzxfVHo9fF3zc6I4X3js
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bde33 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=bjVS6o9MGAhJDIbh6jUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX42G0Agr/gnV3
 /hDAQFDOTcn9kkFvseh7Xj9NyyfAB7JujNbyh6Jrbxq4I7VMzoRDlDJmMyD6E+dE6NAQggWOlmV
 WTid4DZgIEF14ufJ2OFzyF7WG3dsblk=
X-Proofpoint-GUID: mv9p8fViasiLUzxfVHo9fF3zc6I4X3js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXwPxsXxAD4i0s
 IKINm88Jyb9Rm2vj8qmcdlKlVtTmj7MwTSXhcom5XsVrPxt1YNuv6n5I5TQCIwwDCYJ207rkqmA
 nmz+YA0zvnJMK6d6Ya+c54gDEzEh61dXPeUQuIsi+PyTazI5OpyT2s1w44POA7oNlnb7btwgSoX
 9Wi+8IxuUzs/LDh+0KlBPAJT/X0YfRm/uBgiKofKwjGWzhfEDqTzzIlF/vcFbCpMcjQBmqq29+R
 G03yTeUBouziKxBOILJmdMvtmqQPu8vUMuV777mznUy/dJdwMm5vA0yzP7ykwRUBAWKffQNye4U
 NY9HoE180MfpMu+yZ9OiHnAelkgz6JfwPiDuh+793F2tKYKMhV6w5fjtYQrlg4WXIi3OdGrtDHi
 6edFsEzrIuDtoCqWupIH5vsEP0h39ifSisVxJ9tIr2eK9pjxxdY4gJfrRQSyoNKxTEju1b4pYea
 9Yn06mdflf5h3G84khw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170

On Mon, Jul 06, 2026 at 05:37:16PM +0200, Stephan Gerhold wrote:
> Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
> subsystem control (ssctl) QMI service. However, some platforms (e.g.
> MDM9607) provide the service with a different instance ID (0x22).
> 
> Make it possible to override the ssctl_id per platform by adding it to the
> platform-specific rproc_hexagon_res struct. The same pattern also exists
> already inside qcom_q6v5_pas.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
