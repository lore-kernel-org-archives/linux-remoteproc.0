Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E5305E28
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278175; cv=none; b=s9h3+Bw4jsUUTtC3lBtYAkwbQdhu1/UDogSztQXznDneQLc0YM1FWHGJBxg2dlcF9BaWgqaXL5CoTqVcApTdvCCnf6G8eVuYuHz93KBP/xdj2d6bmvhl0aLmU3bZWx/8lwUuYo9c1ci6AWVjUaFytOnesm5jAHocbPxTi/Zob0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278175; c=relaxed/simple;
	bh=T17x5FSYTfh9vCvsdSg/wE+KeD5tHNDbO0VJlhTCAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhArepYR43gzOgm6SB1Bt/lsT6mo6BfgmprjhERonar5iWjBV/El4H2YCDn4Varlvv7Q8wJWL2y1igfZKZ/24zlUy6W3ZB6Xzp47NNrLHnnzZ5WhpAq1yladL0FKWRNC6mVHnNA/jQ9h6Si5hUV+A5xd68BUdF1fmpqQS3hnyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr/SLqMr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bC5gAOlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr/SLqMr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bC5gAOlQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cTAb1019008
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=; b=Vr/SLqMreNIHAIwV
	1HSyJYKL7VP7PBforMcctbIZMxh6rqr1XMRzGqmD6I2M6f/pIiBGWqKaRG60yxek
	Ro4LmGA2TewYyF5qGR6yZXVBU6/sRyNOKIjG8aFTMr9l1MMIkwkp+GU4rPmV0lJH
	fJJtOLA8Utz1vxhltyOBkON9NpbyplQEyz7X8Ixou5TUdkfDGur5cSsqrw/Zw+3j
	V7YMyP0jjP6h0itWAMDDwqZYSsBG/QWsPH+J5QfNo+uQM+u2uKSYmnQhC9hUPlrw
	TpDemOjwiaQeBIwc8CbhriXxttrq+d1/6WHXX2svbREqe8/4RTt11OsPbFq5twrI
	AOUyCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff810gv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:49:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e57e56ce9so152299685a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278173; x=1784882973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=;
        b=bC5gAOlQuVkKih6Kf9JTj+3LDaVqxsbQG5sYqEWMo9R7s8beeQx2+WMQ/QcYGbnivP
         b4++yKDpCmNIN5KtCiOASDqGuo0DyB36O9skYb7RIiCm40gjtnFcSgdJFz2Mf0fvnJnj
         GklQ+Vn7Z07036ciCpljFT4/InSNpz88lh38iraLOUTHf5EC1j4Cn+Q9zkf1k9/8ziw7
         UmcICgKcvVLcgmgeQLx6830iXvuLcDP3ypn5ju+apaaur77l7rCy7DklPOBJTW/k16v9
         CP8qArrpcHl3BOGYzP2V4rX4tHrs+fILKwOhwS7sqhV/fIAhFarOQkJ0du5xHh4zl2Fh
         xcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278173; x=1784882973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=;
        b=OFl95dSZpHR3I+NqMhAdMz8Ktvt/Ok2SmC38lNgJp2FATjmmCs7aNS/+QTjJ7F4enm
         zyUs1stOtpt0O3XL0Iond6Vwkrz9gfeytfZR2wrESek4vWCM7Bmb9k28lkKuIciqxk57
         QMCbK5jeCGlczFF2sCY39WL0hZHLlcO6rJH3Wcv7f5vrAFA0CRuK0OvyqqhFMfcdKRxb
         rRX/ODBpxO2KdIvLVmFGNKMw5+eCpXl+taFaniBltDozfVdU+xRvwQS157KAGK3GtOg2
         RSYYuN9OgoDL3xuq6zBSuPuY5vCJsZaxMIwKb+/N4u/qjCB0J+0jBn0u1j6/yOqCP6z1
         vSJw==
X-Forwarded-Encrypted: i=1; AHgh+RqGoNPBxneV9UF/x3+MKTPB7UVzR7pUGnx++SRULIpal+zzLoqItMSEBbK2ik+3ffD3sYynbwfOfhZ/6quCXfPk@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPCxk8f0etawxH3QF0DjNFiL53WMBS2VOcUl24wze95hMfzVp
	qzpv1YKHyV7uKuVCeUY4V6eaDY7VE1nwUIv+4FG2q1wzlrKMhBtQaWMEY+MAxqDo1Sn6NcyYdga
	JpPgGPHTrds2xkSGxx5PBpPakzVhMKXR3GgHc8vKhXjZsFqFx8JsE0ibkaPHA9LhIRRjwpplF
X-Gm-Gg: AfdE7cmCpaM8QeVcCkMUrRFcgaPQUcxrQpI3RSc0QY7Q6NHxGHz9FMzSgOgXDv47Ngm
	qNdI8Flh/6u5HnN/s9tVPgDJ2EYQB7+fcu9lvmr0HFzyjIgCvT7WmumqyKyLHIYSrOhTo1JD5kq
	/LlVesyIfZTA0y5rlMRaNsdW11zsemv4H1ekE5p0NQASxD70K3T5rCBYSDe3lCZicM2khyaSY5G
	eMpLlbN5U+nV/gTCD8rf9/p4oR6jU/oipjMvBxKmFHcjXAZyBSmTA703O+1IwCt+TvlCg76iBM/
	ueFUwgx8p8cYXDfeeFu1Gc+DlT5bWS9vdyuOq2c8ZDe+++OYY86cM72L+TYWF4i1Q0vbiLV3ys9
	cB6CUWHiy9XwjcfJGSFhv5vue
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr105142185a.4.1784278172690;
        Fri, 17 Jul 2026 01:49:32 -0700 (PDT)
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr105140485a.4.1784278172259;
        Fri, 17 Jul 2026 01:49:32 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbc8acsm317537a12.18.2026.07.17.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:49:31 -0700 (PDT)
Message-ID: <ea54070f-5292-4113-8e3d-23caf6480e79@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
 <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a59ec9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_LHxOxAbYH_kBMrIm04A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jO-79SVv_aEP982QV_FYGkINz3cf-FV9
X-Proofpoint-ORIG-GUID: jO-79SVv_aEP982QV_FYGkINz3cf-FV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfXxRuTjEvvh67M
 Rla8FANyEO2jlAF/sAFlDbTToaYv2JKU1tH2cjAaiIyKd1YLSkFMfBza3CL5mlHRHb+Ao4Dflm0
 PWWYgEWeJEhn2GThFKuCEywaGKxxq2xb1/dyaP4B12QunR9PLP78S7jGLCUFh0o0bH552x8qeq2
 whIKAPMWiG1RQ5HfFz9wKAKAlcr4/MQBgVieIja4YKXzkI67XEKvCiKy//A0/PoJNnpqVCe4Klt
 ed9EvQXXXSykADTyLmcv8QKGu1VLR45a5D/m7DmjEfeM1L2vUI3h8awI74PJ2uzbww/wkiS1+Ls
 wfF7m8GfBXKH3yVc/KqGJ7iK83QzFUvk6KR6Bq9HVr5Fgn+CrHh9tCzluVuP+uZlnGcrq3xhGfq
 TJik+HE/TCaMBQH/c7PzVglNvYcJkUhCDKJFV7/H1+DK80HO+lYiPKEnCrMBnz6vz3xR0imS9WC
 ODWYHjYGQhXKxSmeg6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX0oFBvGC0IbaK
 Famlv/veF1vPoRofBj6ltCqUu2gdKVwoVMZeC0GhUO/VAQ1PR5oit+1F6zcdaqvvx8YBLgH0LcV
 C/0AV07eFAsMwr7ESD70SlJ1SaYLKvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170087

On 7/10/26 8:39 AM, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

