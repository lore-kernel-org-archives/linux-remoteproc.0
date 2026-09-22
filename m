Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BFA518127
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074075; cv=none; b=LphSbjGbt1SU5faZ0BH2lJadsrj5bCzYfVj2XxgtT1OHeHrcaTKjYi3gcC5KYcFJ7W7an8XRBvrhqnP+r6YK5jhLeByCSJ3SwFLZ9IbRbqoOtcwIBjMugripGXVdDUKVVNs6cTh7+9OPVjM3A0UkLAPLtKeYv64rt7b0P+GKdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074075; c=relaxed/simple;
	bh=Tf/4+Enm9D0/NAqukZyJZkFtEngdm8tIFRIReueUIAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CB8ahDHVd7iZjJCbhgrYr/vjGKdd8p6DopOEhKzEONIFYk8AiYctQGZXHp0auPT3UnGOdKpUpuONXxSi1lH3k9bH7dS91WVyBYNZw7pLzmQI8TFrWjGHyhSlOfWT5EBZaF1eutIcX3tDR2Jz2UjwsndAhcGe/cc9r+2VMB0m4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmzKDgLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPEXPiV7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmzKDgLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPEXPiV7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9PTJj1842299
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O84WUB8dqqEkzuvtK3pzGiiU/apicX+V39vVDqlKB5k=; b=mmzKDgLzjvr/oxYF
	RLVh4FDKOrtvlqDbIMx2hKJjCyyZR38374W9IoHDiL++LHzabXWY0HeZUPofC7ee
	ziRtbrpeKsUGbUVpaWLY0iblTGdy/TPhEOxzc4KBSiD4vjcm09SBuUOVJFne3VYQ
	BdMpvXrPskR8x5HkrpxbVoqUT0P+p8Q0Dvgf9nyON5rd7gkS+eRPx1hP6DIBbmlj
	+cL7IrTm8lmQMKEdwKv4YgNiYx/Ux6qR/jKpkyi5tQA987R2Bk6wICOHG2Y/sH7I
	IzXNfq6kV0CCb8TlA17xpEm0TbYUiRtowslE5MZmsPoxiCXkrDsp9JBgzBeXeK/3
	wiOJhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111j4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:47:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so126051385a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790074067; x=1790678867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O84WUB8dqqEkzuvtK3pzGiiU/apicX+V39vVDqlKB5k=;
        b=QPEXPiV7U0alZGkprp6ixKBY1NgAxYC71A/XbRZv5Wrl3R3XAFZdMea+AdJ3OhfLYJ
         vUuVUHBMUQK4lzK+B0DExUAD4jeJZBqVTBV3qGQGHXrVibv2ckVVrbxu32CTom5vtu7Q
         +quom4Q/Gvy+GJRRFMHAcTveJzZMpcOepi0gXoqxeFU8gQ9OnQibY3dcXZbcMobk7l39
         z4PB0TyO0t8OqRB582SUFWQ97aNTxe1Gu+FseYHOnNERJVO9cO2O26uA7ge9FBH2AkX5
         yrv/U9xd49ehjeiqvt1tHsaZVZ9v2jQU5a3Elc/Tbr7VZ+9sIzEk3W1slEM3YX2GJg0q
         11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074067; x=1790678867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O84WUB8dqqEkzuvtK3pzGiiU/apicX+V39vVDqlKB5k=;
        b=2muR2XVQEzbexTT+KdNjFvq8eiPNYau2CE9zIhNOuQJ0Wv8CupNG4UJGozsU/OaFsy
         8e1dOJS7RynwaLoIXwRp2Ivt6mh2bDyoO6wJ0t3Ennfgv0SzCEvAn+XfJv5T6fxllEcV
         Lcbc5shQyIY3BuDh5/NgAMgeeUu9IbLueVmQ6PG6EszbyEbyJ6KhsjwVIbYbl427Vbjt
         GnBzqRznnJFBJmTKya6dOP362SVDvtKrrHx3pINOWQmjiHJjautu3ci06pjFCuaAcKss
         pYc2WN3ryBj6ijZyP6qYEoEs9BxCORBZuw8QztDs8iBEgCVZ3gA5ZMbH4mxOxrHj13fO
         rnEg==
X-Forwarded-Encrypted: i=1; AKwUvBwhOncNvfFP9ijqMA4t7HZoopivT4r/6E/OZzDNWJVVNJPH3DhTbbugdi7Bzx+kdIpqY8yrSAjT116MCjDupd3H@vger.kernel.org
X-Gm-Message-State: AFuF++mwWGiHP6eRFZvIsM06WmyIq4EX8eVnCyKx9oCqM4tle+6cNH11
	644qXrkqyYlCyTLBi+eorkl0e/wC0QCkt9krmnYeLglR3/FrHUr1VUzWnC5BLF3Cm7AtroeErTw
	XMjo4Wp4uMrHxQdwXQttv8Pa9zRgS8bqCJh0VVXUqU+02GnmvSwSVQIufbgR9nJw6H6Gz7e+i
X-Gm-Gg: AYBFou1CFtXLoVQLI7KTAH5X8ZuFRDXhqu/qGibnC8k7eb2+eQrhE4upmEVPi7H7WmV
	XoX65cqaegBVtMimCbAGk7P82C1bTZYnuT48l8BI2VmaHVmbwD9b3ZCiAbFpv0XtBkc18gTqzxy
	jvTTn22QxTCSGo20mrpC5E35D7pWOtYUj8Brj/9Lskc5h9+Ywx642bX4SuEOaidIY1TR3Rfu8A2
	NZzfKKx6/s7XNNApgVEgO/r2umWqzs9oVjEFN62Uv6gDnfVnGy60cigdFl6tWXGQesWy+1BDX1P
	4QMo7Z/+3mlAiuvims+X1AtEzmUeDlMppnCK01vOziU93cc7AyZrnBwlNmpcLpX9zRS3847WaX4
	Sy2wRcSAytjTADiLB144Eyw==
X-Received: by 2002:a05:620a:6484:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c15fefd21mr490654985a.6.1790074067532;
        Tue, 22 Sep 2026 03:47:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6484:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c15fefd21mr490649885a.6.1790074067059;
        Tue, 22 Sep 2026 03:47:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c42fa4dsm63760066b.3.2026.09.22.03.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:47:46 -0700 (PDT)
Message-ID: <f43ebaea-05c5-40a2-882b-3211e3590476@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:47:43 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog
 and digital codecs
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-12-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DE0Ql1PYksda-pzFuCMid_gE6WFM6YlS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfX63wKIvUISCzl
 xc/XwsSWrf3I6GjsYTSEzclCG32smEx/F0bES0Y8wsSombNLPkPghUQN0ZI5bjlMUamIZZMjecL
 dZgXpt7Zame8PlIEFG8TR7182upGl8E=
X-Proofpoint-ORIG-GUID: DE0Ql1PYksda-pzFuCMid_gE6WFM6YlS
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab25cd9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=C3CjITKvYYIGiS2BvvcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfXyoweZ7v4wUGg
 cMjZNgZuSF37cI5vsXZclx+srRdpdukac3G6+plqDm8hOZmuearwOhZO1FSOXlmWpuqm0kcot27
 xfQRd2mznzoI/StiPp7BPk93D1sTRD2ySQz69leFOlRE2qzu7B7GbTBhDOsnh+gxhock60DbIHJ
 3GyJoGDDtclzDcZ1S/5SAdfSan5NlguFpaBG6W+T4NrXDVWB9g0R3RCZG5c+/woOm8Fb/cByb5T
 ZDIsnz9NjHxxUUIE1z04jnG32XB0p789M+Po7fyoYgKuSCJ8GL6/RkMtMFpWH0eQqg1zBkBKz64
 x6qTwKKI/tZsQ0NxA78uJ1XNSVkdNmaDtW3vIZm1MYNcAJmIEiqDtLbLsCmp34QELQ8qYpTu6v/
 MPbH86Mlx9ZwVmxNoZMJSduLsMzhYRZMIrXnYKVbR3j+ACIIDtLpIC5sOpdY4r6VgmsFdAHY/N9
 zw0iWJOoixPPLvkhouw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220155

On 9/22/26 3:58 AM, Richard Acayan wrote:
> The SDM660 digital and PM660L analog audio codecs control the headphone
> jack on the Pixel 3a. Configure them for sound playback.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

I think it's better to squash it with patch 10

[...]


> +		lpi-mi2s-rx-dai-link {
> +			link-name = "LPI MI2S Playback";
> +
> +			cpu {
> +				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6routing>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pm660l_codec 0>,
> +					    <&lpass_codec 0>;
> +			};
> +		};

nit: 'co'dec , 'cp'u < 'p'latform

Konrad
