Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B523093BB
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530169; cv=none; b=dV5X6oRMEI6WoOhgk0sp30Lgr2kciPhx7Pd23zPWD2SpPTImWIAdzrBLUfp9+EtLU7ToaPcf1RO9BbcNgHypoMBDFFkb/YDFwEh2jBiqIRjoBlLxfG+STDWBQwBb98z96MkycpkFx5WylPBSwwlWxRRc7Mau+jetbWwQotxomNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530169; c=relaxed/simple;
	bh=Mcz56Jl+p/soPmNbRmaQsqePO5EC6zzwHTPcSBB+GxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRnM/X9w1kXsRJKpwZw30t6jO4nSzRX6EfoRRuy8yM6HA903dNt/coWCVefCd7mTfF98sZdhBNHfho+xfC6WaAiyYif0l6uJM9q7p0Scs1Nf5VMXxEtgDYLFr5ekjAbHUXsxIsh+8TaUvISxfNFg7aVHRB9KJGsb9YJGe+wSQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQcXcMC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHWD+NO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQcXcMC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHWD+NO3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCRKt8159744
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 19:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcKVJlOB1hmcCtrOgSV1bzmf0u5ByVni4PLnc1gEtbU=; b=gQcXcMC/lVLMfTbm
	MlpJhArBBl1z4O8Hw5cM4kXDBaad8wkR/JnQNxBYlP5+MMD1tV3FIpa7U0S81mN6
	+X8Zq1t0rOxBR434rpZLsMPbNtudG2efGgzWdZOdqlCHv1jm/hQrKgWFxZgTOStY
	ThmuBhi3XEGn+nrYvXZ0m5UG3i8CwJx4jmCvpLibd8rkTAKYuXe4quFywLpc030T
	PCXApzYgwu4DmYZcKb8JhRDv3GdpfkMAZiJW2XhpnnGn5FPoabSEM00cRMRK27sY
	ppOIeg0QVP6tP9vtBkuaVKVjcJq4FMGZzSdVNd7s/gsBhhgHebBUljLmv7Xf4jxp
	cFPgZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpgarhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 19:42:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bd2a2028c5so1923110eec.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 11:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530166; x=1772134966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcKVJlOB1hmcCtrOgSV1bzmf0u5ByVni4PLnc1gEtbU=;
        b=YHWD+NO371tK34TobBED4fpvK2oCH6amQn9QEKXemME9flFhsG19/D1v4idsNkbOCt
         9laQzu3JqioxdpQ6ojUJfQZ1NDduVDnNBGTJefdIztNOSJzXDeihw3i2MMY2dLZiXJJT
         SIe146RJgEyY9HVn5c+r8fLPAvwVouJOblFSiVVXzt7SqBs1ZnvGySXU5g8GDHT6llP+
         jfoMA8mXVsHLO5qkjz2YR9+Gevu7ux/O42BWr19s99U+U6sibdWYpQJn2kx6+lzNIZR3
         WNKyYf4szAhXN58YXJxuKxtXj4jaauhsE3RWxq0aVU/rxr0tCKtx8d+XYTtCv3fUrxRy
         NB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530166; x=1772134966;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcKVJlOB1hmcCtrOgSV1bzmf0u5ByVni4PLnc1gEtbU=;
        b=qkj8GpOM5MEgIAZcO4p3wWWs2vmTFBEGmVbk8QhhO4XE6RQJFQiVkTeQKMsoDYThjE
         3yoMGHLsKUt/oVqzTs6iFa1nkTgt/wcGlo91q92GccPn9xD2gca/Lh6EgTX/WjNRC8eG
         NBs4KyEN7hIpvNZfKH02hkeiQbxev6wtqMZAf4f0Y0J4BLtkctQWP9tNcx9QlJfjdmiZ
         0YTJQI7L1AJEtS5fEQaN3Rl6DbiMO/aEgp6lENaMYvizqmCYIegBRGMDy3MQ7mg74Uid
         KA0RCJLtycboYccROVE8+QBSvqvJ9zwgOpc6alAaPCXsyuFi+vSFKbVLJl4DdTsuCxJr
         LiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoYK+AsSblYRUbD9pIsHqGySAQa2BOO+ywAb1Ob76bCgA9UPMFbaaDdTixiN2hIvd6f0EQuale3ReWCNnjPtPc@vger.kernel.org
X-Gm-Message-State: AOJu0YwkfIRy86slrj8QgvsWJZelDw+yN9zxnG9u1LfxUXbZrFCUxxJB
	bOl84eZMb43LL16IbdSj0v2uaevElaGUs2MdN3auZp4ZXPBHnMmgCEn/9drsiGgn+jXa/ZmZoAP
	zryrHVzbuJnPTpitf3SP0+0jGKVMHGwmBvB6gr/nC59FZaqUrsG0h1RWzCe+FpzfOAFgIZFyf
X-Gm-Gg: AZuq6aJclUeP4HZ72Wswmw7SWKJMn7SuTFyC2xrU8lGhBA6aIpuryF67dOPItpFM3rK
	d+B9hxmYOIR9Iw3gTbZq7VyqjAeRnjKghrf5UjoLi0zS212u63n3kChPjt1UHybXveCACfpBlnY
	iG5eR6HG/Uff7InayHkhbd/xI7O9pFz2Z5aeZucweygy2L680Ne+Cw5CF9f13dgMWwqXg2IuZE4
	4aUIzw9QASb6ag7Oe1c3ao+CPtIWnjV1Vluwdd9QqKe2v86enfQEX0XCiqXanX+ZMn5Wl2i0Vj6
	mxzKwODwo4pX6jdZatTnO0Zq6xsUkAi3pw+2eIy60pRxUzYBOzb/O8KUEhvrAnzVaGgNBb8YYON
	QdpanFWeqzUFDBWilsOkDGDnjigWF2MXrEy7An5P6FKqtcFB27i2sCTdqov6V1IVKpqeO9NbcNO
	s1/2aOny1K9yKdnw==
X-Received: by 2002:a05:7300:e614:b0:2ba:6c1a:8818 with SMTP id 5a478bee46e88-2bac97d241amr7644333eec.29.1771530166278;
        Thu, 19 Feb 2026 11:42:46 -0800 (PST)
X-Received: by 2002:a05:7300:e614:b0:2ba:6c1a:8818 with SMTP id 5a478bee46e88-2bac97d241amr7644317eec.29.1771530165725;
        Thu, 19 Feb 2026 11:42:45 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e1dsm21614319eec.4.2026.02.19.11.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 11:42:45 -0800 (PST)
Message-ID: <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 11:42:43 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E5vCgDjpkZnJZ9ElQbdv6VzUfwd8QpPr
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=699767b7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UqCG9HQmAAAA:8 a=bzy-IBSobD9MKY258vcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX3fyF2gKYOCth
 dZTSyw78LVsYD44vmjl+rBkpqka/kBF0wDh8osqkPlBSmgL6uaUrKBWfXFgMRA2/w+bYMIWcAlt
 UHqQISCmiEY+cu5hTAaTrr7FdSrtEw8Eo+85twb9v2ygqspCEOCS3C9fApsaU4x0YB+NnMAfgH7
 VDPms9BOxZ9cdSxJ1te8PoWQI99aSKURocdI+ns5trRZLz+MluVlMv4LQ7RkTVN9pblJHm+gG9p
 4FGtmpIGld7BmGD82NXIMY068WbOfuBy6HaZjz3jRVvx6IAuXiT42DT/aYmt54bvCxTikt+fQl/
 v+wEpN8kSZWqC58Q2SmB4E/w58kagYrtkYJypiSCefc+Bdz1uYnd5K0hrfYVqfp/9XfPW+qmwxY
 1VkHX9gOSWiGFwuq9DrQED8vEcvQdYfpWU41erZZKyrb6VawhKIG4dLkyShK2fjlwn1su5H4Kwu
 OPgjNHRP0JLrrXA61bw==
X-Proofpoint-ORIG-GUID: E5vCgDjpkZnJZ9ElQbdv6VzUfwd8QpPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190179

On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable nodes required for q6 remoteproc bring up.

I just recently became aware of this series, and have some questions...

> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq5018-wcss-sec-pil";
> +			reg = <0x0cd00000 0x10000>;
> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";

This file does not currently exist in linux-firmware.
Instead there is q6_fw.mdt with associated .b* files.

How do we transition from .mdt to .mbn given that distros update their version
of linux-firmware independently from kernel updates? Will we need to have both
the .mdt and .mbn files present for some period of time? Are there associated
changes which no longer attempt to load the .mdt files?

I ask because I've been told the ath11k/ath12k drivers will also need to
transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
sure how to make that transition.

/jeff
