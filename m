Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58444AA3E6
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844169; cv=none; b=l9ovZggSYCs/MLaGZAPgCf3Ph7kzG4wIbWURQLJ+4J0FuB01ZrtpQv6CgjMAFcv8O1Dr97NaSbaDMbWvHjU4b3Pw5FCko6FAEaZruE4je/eSvbvX5nhz4XvYenkQGIIBHf8IXfmmydnEiT7G/qPGypOU1etLSFlFe9W7WuS0gn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844169; c=relaxed/simple;
	bh=yvAl4xjOA2pRHrKdjrg+4RmlERN0xJQ/C/7p72SB2yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elNRAQj6kAGqSkSD+Dn7IBge/StzS1XmIi/5LozvWLLowOHBm7cKQujvFx91Q3MrVmiJlPK1lv+dmvWCsu4stegQHT+15BCQ6obVusjGv4gMHLXuKeqLo1deoh5Case2i+JlqEIpU4JloeUQQAY4YY6gRfDi3CGJWMgJbgGSQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq3Tx5fl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eu6gaiLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq3Tx5fl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eu6gaiLw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xOCW2176831
	for <linux-remoteproc@vger.kernel.org>; Thu, 1 Oct 2026 08:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=; b=cq3Tx5flAQse07nt
	Az2xrQe6uUyD6QXF6qmNxibg/nQjzJo//4u+9zzhFxPH106jlcD2yPPbWYi2Uhb0
	qiUXcPLtDAlc7FILg7EPUxAEegFlmO7REP3SWbyc57htxW6Sso7WN4/HkQjYg4VF
	6mdl+OhQSGFfG9qolM0TKvCbjNW1/x/ELppz0y9Vz24/PZXga2OzxWx1pDQ3rys5
	3cjve3SdEMLtQeJByV/wwk9LWH4sFJf3e0LrMLPx/jP3hdFHQ99dALZ55Z78a3b0
	LfVTBz82nWa/UqbgOSTxWRIt63c6s5RO+KRENccmGJC4OGrjpkwa8gJp/D2kMxHw
	XiuyMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nrrt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 08:42:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so15797485a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790844163; x=1791448963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=;
        b=Eu6gaiLwgblQsHEbzeo9A3WJe6gC3VmqDK7en1HGaaL8b4OvcttmGmy7ipbi4tNC3x
         FIQPA1anJjOdjhErwblgGVa5maZAdL1zrKsntdH+5PKR+ZTbPBcb06No66iV4h4qxOBK
         V/iwwi3RBAyCYWd5ZfLcd7sE6bbp3vlbRb1E+zkbA89zgTMd1juWXQVHxl9w3QF4lg8E
         eRH0kfjcmsrc0cLyXzldzcFYrolixcF3FK06lCKDLbh/A+It/SsJIb+neCRGV6ctXgwN
         dS8+bsxOrqeOGpJnGBcLKysxSxFab/2vgYVWk116Gf9mmSjUZKqMrm0J2pqdigdNowFh
         BjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844163; x=1791448963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=;
        b=0xp9wHXuoDuK0u7rObTIpkEG0eYf1xHft4EMVDPGZPiXA5FFTukvmPouIo4y+5dARD
         o8s9pi6tsWCgczXQR/fHeKI7iWBzpGtkS6F4Vki0ucArdzvoclfyHJsEaHi7obtFCTS2
         D7p7johAxrOSp8+XpyNTwthbjO720aS25TLZlBiaf7UUJ+qSyqdR+Lyyxp0i3AAsVzyZ
         lq7Ouyk8WNGI+i8xgmKoM9XEWC+EwnRF3LrNq+Vp07MuDFQTpE4EG19MEkeL/C/Srl/P
         08K3d/PrezxEfzcrB+yTCAN4iYsjCFdCET1021yfCBaiYExngZz3TDoZFgIyc6RIHnf1
         8xZA==
X-Forwarded-Encrypted: i=1; AKwUvBx6MdjHmHXiSLYEke/gvFOWnoFcWUujFFotPXe+hhgb/RT7/BrrpuAiLh6PevTmah5I7LwNesrnKVNnIU3Nsnls@vger.kernel.org
X-Gm-Message-State: AFuF++lkuuf0WB1zeI5mdIePSMy/hk0VCDzD+cGt77QHMjehEqTBR32o
	U+oW37/hlao/XmJTBfdfXyWMdu/xgDFjK3v+XiIAIMnc3eJ8XCucDRD+zy3I56HNfs36Doa071V
	XEgt7ISuk6IQMY8ZNZmIU2dtZad+pVz88PXAqCYCbd1dpmN7Dnxda25sfDdqRvXvSJvSQh1+C
X-Gm-Gg: AYBFou1iXJuzKH1lZW9Kpl3GcXOJ7KMuucd5HFj7roOkI1T8xqhrZtLMfeBcfr+Jv4M
	KVL3dZDJjDXvu6OukUzEcylBdHSaswUsYkScJGN2fdCIxdYUFAV/gFmsMJVquE+i1eYj/e56hxP
	guslckHdl6xQoxbjW9tRq83ejtxX2NdW4Ke+ExNpzQDFaoz/lL1t+vReXPal7qXWLMfA3asRjSF
	/y1AuMdE8h68vwGNlwvnA4/NU7PkWuojHjWxCh47dNyuSV5+25K9kWUaTkhY4/EWh3FDv702Iz4
	nK9G2R/Aft4MjnubCZWpRGpzErZXEpdOX73hvocFRnc7xO+t5z2eKhXcF4trRWusLxDv/xp9Ac7
	acdE75N77Od7SW8a4WMgDHA==
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr643090785a.3.1790844162423;
        Thu, 01 Oct 2026 01:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr643088485a.3.1790844161997;
        Thu, 01 Oct 2026 01:42:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8efb0sm107709866b.23.2026.10.01.01.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:42:41 -0700 (PDT)
Message-ID: <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:42:39 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe1d03 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IuaHxTfj_tQD0nhE68oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXyVLZ78vcFJ+J
 OyEwqG/XNcWDE+eLh7WH92DmSYm8roRxWTyTLlCn9WM8I4kgacAKT8V9C0ivwv8NophNCR8iioI
 3wyQXnQ+RAfI+ahIECg9FFOmHnrfAw8=
X-Proofpoint-ORIG-GUID: MZGBuNRnGd4yWWGo5rtVEk1xhgvXhEH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX7LoUWEfzzLBo
 bRICbZwlHf1eCOBIrb7NRnc5Gkq67Ff353OczyRvkM/WbOnJXGLhOp7EC7vakf5mIPuUtP9wqfj
 2hUVSqwMa1IxXPlCUGLr6V89564Ugd6c403MK9qyqe0g7NufHSw2xNzmRzwEDqCwACQFCdMpb42
 RJPI5bUWyRZCGU7fWDyz070+LY4LeQ4WSjwN9tp2uLTSSrKT46tqXkmOJdYK24xQUBbUaUwbQOc
 iR+Oh567brTmhJd+2m4CBFD/hHjQIDbTs2dimzpzBA5R1tqnYaTGkkw3uX8H+hhlDV9LvxV7SlJ
 ZkXCHUMDElQ49b4RHxPvsybq+L50i9IwpzNF/tjX7j9lSjmAX20vdARoAoBS+GfP+8ubFa62Yl2
 YB4I3hfai9hJwkY75W1JKK6e6KYed6pE2iHLtyDKLduLv48OIb3/5n+6lH1BBDLSDE62SMxm6HZ
 QhQxxo3cOqcCfcNmVlg==
X-Proofpoint-GUID: MZGBuNRnGd4yWWGo5rtVEk1xhgvXhEH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/30/26 4:07 AM, Shawn Guo wrote:
> Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> Nord ADSP for that purpose.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

What happens if this patch is absent?

When the early_boot path was first introduced I was really hoping
that this behavior could be made unconditional and Linux would
figure out if the rproc may be active by virtue of it sending
back signals or not, unfortunately that hasn't made it into the
tree..

Konrad
