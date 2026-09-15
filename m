Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5F48380C
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468046; cv=none; b=dDm5Xa/vbTZEIWReLqtaS3q6at67AErSJudD994qFASE8XiogkVFAgBiyjfKQ2LovjLnGseHqaimfjka+gu4yFSo8VFhgjxsCMvIhOalDug7ADuzEpEeClbVjLFqlGTUvvTF2kZofjvq7mRVluhnTXUJ/+8vd+2gWNMgHejruZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468046; c=relaxed/simple;
	bh=ckBmQCsGl4i0H5swMQltGNEvLAQ4QNaTpkBEqzAPUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEqMlavvnjCQn5wpeI0J0Iu5djqpazq+0s8xum7FVF8tbXvrqg+Hm/EuC4FY8t7vmn9O9i7jUTCBnSB6sRbTzIcekBFi5Ay+a1cNF6RTYEDjD2GIGjbsYsTPuxZxaAsIsDDBHztDkcf3KZ+vdKqOYKOnNEW3JtKw08qxyNptXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIwOYd+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6rDcoAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIwOYd+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6rDcoAE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCPN064511
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 10:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=; b=bIwOYd+JYKFSCYrP
	nCi/eAq75tXkFs1ZYz/8MAhCy2Nx5mfuB+SFhJqYWAdqO5Ki8XFzECuVfSnWzAuL
	4thiNLSTzeKsrQH8W8M7dEv7sk3jh/6jCBbsThaG7649O4nEo4YKTFQMFhfbymVa
	5/Ra+rKB114Ves5BkmJ3Yct/+R9zfzlYATVK366v4VWegslqrg2Cxj3wA/GeutJ+
	ZWlEWlB1EpGpqgJqPR2SIE7wQw3G1l8luRBwF010kkya2wbCAhYUVOKD4FWDU7b6
	TfjVDwIpn5KdQCHsae/OHIlHaGMvkewseomzIlAx7Aykto9YgL2jjaR+TswQDBU6
	VQ6W7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41uy9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 10:27:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1bffc2eeso626065885a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789468042; x=1790072842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=g6rDcoAETYiBRnTjEONziPRHVbVSFjS4pUlw6OKj+KnU5HzNvTlaqwh8BO/yTUs2a2
         yDAiG6gDxEEAI7Mvrm/wnTETKU8XXbsh9a3g4HeYm24EV4vKMd559exRNXvdIRwK1qFH
         +JeMbEtLvf+y2PVHCMBSqIWvCmq4KPbnl1Az8x7V7IAyYvsIxnCqvJ/e36svuGr8ui0p
         BaAvKW6zIPYf1Cs7xGnwrw8y3KcWhOhDoxMF9hBgc+kxACbwhsa2cyOgfs+esgsb9v53
         NfPJ91gbkXhNYBk1ftddv7bywsnCq7osJN/5CLpyqQu/3IfJiR//mZugwwC9DWJOTmLn
         SEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468042; x=1790072842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=Sv5IqIPgwh+pxhNMe0hwsB/yw3Vot85waA0JxGWFLTeaJAhBWe/CNxD2Me3iHJQwgo
         RC1sZXY+JXeWu0sKfAnx1a6lDpPcgjutvXVdy/wbUjcF8b6HDWrmaxr39U6KyWBxn320
         50EizOL/IYEhshSb2nZDraQ/jAX78Nb9giupGHydP5yv7H2N5jCpT822dfuDU/Voi3bK
         XDmxNWy8ekezKmjbGXOkde5vpxra9liFT7sBX1SAfTzzyiuPGpQn7fZrPKC9iYNIgsFV
         GfRtOuOdCRjWDF+SRrG84UAWe9OcutK1l0zC8bF8Nn3yQSGtZWzuxDTYtKOm89wWAU6p
         vMWg==
X-Forwarded-Encrypted: i=1; AKwUvBzc6K2jO4QdnMRFRrqaBBXejogVMqyYDkk3bWIyRhLPD8+AzEJEYwXX1XYv2WnizM+ZgkQUEdHuZTYfyK6mrXqe@vger.kernel.org
X-Gm-Message-State: AFuF++nYn97nZB4opzbT3p6a3sKtpRcjF8oYoilSaMB/JPXKulaVptMm
	S9g4kI6/AyQA6XBlvYKdMdj/PhsNQM9DT3WU2YzFxHXKO1hupO2LMz0+3ZdmzU0VaA+RsBLbOXw
	uDF2Ox1mRZ1MYoomevJDa8WyuYTbbFu6b8EqkISc29u/mITFOjfyRcu1pGClDMSpBSij31SZJ
X-Gm-Gg: AYBFou3U9yuV9KggGHp9MK6qKgrx01XvbHNxot/HjByBaiIu1YgTXAdnvC2ZOmWodO3
	03PxPpccY1Ykcewp39FjQQMNYoJmNaJ0H6GPGGIKaQLntEpgLC36CcuDytmDHBTAUg7D/jK9Guh
	WCQHY2ez4oBtWJkQ+iM83Me8bL7yAmthwj1hTYg4iwa4iXbzOkFWdXOLrW8GNSM1L7NPCPi+bFD
	1CJXTirTs/QFFyBjwg10QQBXyl1D3zkB5Yq7xwMdGJncJmbqJIESrgGB0CYAiP/Ii1xsxvVALUk
	reVdlZMoQkldnfqhVFpRfSHC0HY/zavk5GnkxVsz2um2VppwYyEZiHcbIUwAJW+tgElIK7T2d/7
	Ip2vYJorAu0bM9s5LJWvap67HRdO44LvKExcY08f1HiO4JPDCTe3/qM111H6enZc=
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921844285a.49.1789468042639;
        Tue, 15 Sep 2026 03:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921797285a.49.1789468037445;
        Tue, 15 Sep 2026 03:27:17 -0700 (PDT)
Received: from [192.168.10.107] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm71836915e9.14.2026.09.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:27:16 -0700 (PDT)
Message-ID: <0bef7837-9fd7-4401-b6cf-ba744f5beb58@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX96uDxiQIkGeu
 PYzeBeCqyhrmWOlTYcr23GOf7g7uhX6uTxD7a7ba7G9tUBExMeNXj2jWa1vLhhyRxQwwUpcJ2cu
 tdLlsg3lEbNnVdZB8Q6TYp23q1RrkayY3g2900l0kpIPjElaJoB8QpvR3QRzhL0lTQCtR4M/a9o
 RIPohg8dAv4evCmfHudDipOM5wnbQEnkLqfnZJfXMXaFGGnFNZxE3sV/IryeZsqsSFLntghxYfl
 FcBh59JDs3WRbUQn/QNJVRtvtzyQSclfnRGnFfAkHF2hEneft3+jrXs6KY3hmFDlF/41BPdp5qs
 9d8uumMtamSsd3Ar0mntoQzG/x+RZPphzAgPJOYvuXNViMhN+Do++g3q7RACbsL33Smr3wDan1q
 HDRNfMuESF451+VmSH4QRZWfHWC+iP9eMU86bywsGoJk95j794dXHtQzeAjW3+2l6S8qZY7K3sQ
 76HVy47jjxPjz509uCQ==
X-Proofpoint-GUID: B9-alh3S0-2tgnqjqZbEUy54UXnPLKty
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa91d8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Zce52TE6RWQhZkoPOn4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: B9-alh3S0-2tgnqjqZbEUy54UXnPLKty
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX7P/lk7p5Kofb
 0SkhzCboP3QifIR+ztfAVqy2g4FjVrfXwDDB+XbzgUKtvcgYrkBtMTTWz2tHL8ONOAqcdMqasYu
 tQQTEAxXwp4EbyTSTGb7xnX4QGNlMvo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150150



Le 09/08/2026 à 14:28, Gaurav Kohli a écrit :
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
> On Qualcomm platforms where remote processors expose mitigation controls
> through the TMD QMI service, client drivers need support to discover the
> service, register cooling devices for available mitigation endpoints,
> and forward cooling state updates to remote subsystems.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Just to clarify I deeply reviewed this patch and made some changes to 
improve the code. That is the reason why there is a co-dev-b tag but not 
a r-b tag

[ ... ]
