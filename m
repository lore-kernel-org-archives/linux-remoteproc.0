Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F53B6343
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144641; cv=none; b=KjUtgmyEFGGg4qjzw1I6gUAr9oR70uFbF6GLO81I+g64/PulSifgz6rfLAPCsfHHei12+peubU378Zbd8BJECeEc4QhH4ZngWazLI1obAmhAE0sMcbT6TvT8mrVrAoCrUm0/EW+ryWuksIzw8uTYN6RHFBEYdtrB0r30HuLNkSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144641; c=relaxed/simple;
	bh=SoGz1wR1Wyop2Qvinvrnk3+hvBdaIxCKNnO4HMCC00g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gbSi5K3E7AvUsD5MAsJzuIEa9JYRktO8tDAoGOlmDqQ5ukBfBwLhjyfA27PYtn6teo6OrCxv0GDAYZuBusHzpeWYlMd4yl7ojBe9ZLCbETbAJPVV1lPwccfANwjwdAvOZDDmai7c4mpoz6E5pcPQojl3sVgjeFLouq7mih+EySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVdD24u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8bqxDMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVdD24u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8bqxDMQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m4uu760366
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 09:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=; b=QVdD24u43PumWTel
	YctVLY1o7YRrIGcwJaLWaaWHvTCPzmn5XBlaTC+kEWDuAH6XV/FiOmv/seM8tNDe
	B1Q+FLkykpmmPEGEcOkfyfZoztJt4NviHuj1OYY6w0Kh8NRli6ZAgTuaiDfekdTD
	FJVpXzHokZ0yu5KqUPmKb4SWIfBqOLYmD2tj7xsUXpa8aISTiX3uLXzrVFfMHGaF
	2prxEbQvO0PZ9kHk+4+DYBTduBVuh8T/qeHtafg13xCgHvEnVzbKKR32QuqaHWU7
	2978+hprQFDnDgOVoPC5XS3kvheFbARpp+jRxpkrtjLVYR0kJIzhlMIGWYDVdl3u
	WxWODg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbwb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 09:57:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635fe2335so512361cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144638; x=1792749438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=e8bqxDMQNq8FYwEDdMI1z56qB+1J0nsuZUZ9/B+uQ15quA8/WanVtk8Mwfrq7mVngj
         j+eu//bmZFwhkolHvQFiU0stGOMhdDBCzBAuHO4H+InS7oUB+a+4cZXx8hLyd3AyOMGb
         J+7blz2kNFSLdsYJP20cksDwYvBZ7ncoDjFcjUce5pxFuHYZvHhR4oFM7NTwkSVT8tcq
         V9NSfvSEqceoICMDAc84j1u/5nA2QJDgVmstpXTuiQH0tVYBq6kTVyGO/GL7lvVpFIYr
         LMPIxem6VK+0vFyOMfUAeVFD5KPvI/AVi4bq+19rnbrNtHEU5A7FRtbUH31jgaYj7lVc
         vPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144638; x=1792749438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=G9SMx9GlAvmrp4HZmFoEHKS+DyFi0VSLHo/O7Q2l96jO1UU0QvW4EMvGzTffgjZ+vB
         urqbLp2hv0DUi3zbwDLlc8jLQK5sNYSGplfuoEiSsq+K0JurP6MLfJGzCwTv7n+ImsAq
         0DiB5ihE4Zr2XnzuhRkRR1n0VTySLZ8Qy4byPDOUADYGtBGnJfkfBV3stMKs23yUGIj0
         EE9IR17zRH1P2cY0x9nQ0gw0/poLcc/8MEjglpGZdOb/s1uJqxoKX93ajLXMHTXZilqE
         CDb5qtg4+Z7yd3LweVyAlsMJJVlAeBUmcBanunrL+H71EKCzRXsSsQciy4m4VSohh5ow
         jqlg==
X-Forwarded-Encrypted: i=1; AKwUvBwB0KjaJtWI+P/rFJCaUMkXcdz0IBozIZvlDmiqgIMNDqH2dvPHpwgAdXu2xSGKbzmgFkMEdwcun7B7ko7yKzmq@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ71fIRBLLj600HjuNE+OD7r08pp3f9DWtxsm7SZVfHRNm9s82
	3u1OLU+WDd0buv4S9QVJErsXotGUouzrp/W/hwxq9CffsfNfDvOgC5MoBHVJvtng+csZRvv6QLJ
	BEasMBJQeAG1SqS0eEBnJdwFkcRZ46GD9mxnsOveLaREzLaTqKL7hT3RMAXmaGlhpetwH0N+l
X-Gm-Gg: AYBFou1nFYKDolSxtiOlQxCafK5HsXEjTCXWlEq5Yzn8XK89LzDTtgC8lx12yR+tShb
	42Mou9W/5nR83bNi01OFOdbnuiFGSriaMpZNocJsZuUTzq7/IHI7GV/hC2YEz1DRzQdmfPI64Y2
	FJ1lwCBmf+QRb440yf+ERxllRteK1+FTxLCpkfmrS+rkVAekFbAHW+5iN9ZncWaDGBVaQj3jk2W
	QZ2Ch2rfVFdufxFo0d9Z5+2tiJRQJp1LzJi5TKEiC0oniqMP/YOZSjO1PTHDvqe5a30fCiTg3Nf
	gfWX0UPxeMFs1ZeTDlT4HbzRtIQoK/6VcharQEJy78hHSSYnGJ3PD+j/CBTXcwsj5ZKpeQFSmuA
	JW3Q2PYm2pDyWIDTkcs8WSA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687800685a.0.1792144637733;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687797785a.0.1792144637202;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm54523466b.13.2026.10.16.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:57:16 -0700 (PDT)
Message-ID: <2ee02f35-3dc8-4448-aa30-331932a40629@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vcs1CFW4z2m3U3zpdFlt_BwFyGop5OG-
X-Proofpoint-ORIG-GUID: vcs1CFW4z2m3U3zpdFlt_BwFyGop5OG-
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1f4fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX82+8DQGWw6yM
 ES32WlJrB/IKLgTMq3fKLecyMvT312aIq88y/Yqpps7eLQnML/MGC+graVJIg6pbnDNxBUZWr0y
 6dqDyoOmTfNVJ6Qb6dnOdwSf5qz8xx+zkr6c0HU6bzxdYk/AfLc5XQsnqrBDROVkX4HHAKvLzP6
 4nO4fTn5lDD4sTtrbKuPU0mrRgDzjvZuFe0dg4LucjWuhwjEoQ6o5dIh8udDQdF7oGv4IjkAH3f
 lm7hmjLKCKIXKZQC70M2cUBnJEhkNg+m47Ek50ijrfkKLovmjAu5dUdjjlxpQ4IFsixWqiT/ehV
 aYjaPDsAXJap20fPOAY5h1hH9635xu7CjL5eOGp6UEX5dwhVPzF2NnshhiVXz/y4/FohqBkhs4z
 3GwHpUOfPKScfNzAnc070R9ajq+h9I6Zciu5Cxj4HEy+HGW1YLAoLijLGRYTh5KBrlUf1dE/6E7
 uQ6b0v1OhU2e9e2WdrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX+zdE2Jtq6mQc
 jauLhNN9iX5FLBxahQHREFFItwRPyEewLfq4tWblSiZGkuV5N1vn5Hh8kxHzA1RGisJRR8D0GYq
 SNU+DR3cPsDr/pR60jG0zFvSp1Dr/Ck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
