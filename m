Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1245040F
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924505; cv=none; b=r826eOyl4yG4fO9vmkISsIiRXJNt3Oy7ONdqrVJhCwqb9GSjJ6/GaMN5oVM5lgOyH60C/OEO7p0VTtBrm6bUd6yPwWNt1+pi8cHGGExmzkQdCjWDEDYzGpw6fmDV0zqGIc51mtZzfvn9hTN6Nn15cWrU3U0I5teQCIRNRXM3Qrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924505; c=relaxed/simple;
	bh=Tb3pJwHKGH06SZSLA9DSDf2HFo5zXpd3gB1lmiQQeaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0nVM79qK7ic1XSnw6x3eq31AKvs5dfdozvJvbTFOSRoM3Pf9VrRWpFvrXS8nzRoBIxL9EerWEykcmKsmu+BU74u9axoS7107WAbYClLEX7spX1vrh4cNw1DMPrdlvDT69rJpsiqjido/U4ibMQ0Koq2qV7ZUbg2UgAeaTLxXXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QU5jOah0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSy8kC3w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QU5jOah0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSy8kC3w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDReLR4188238
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=; b=QU5jOah0tIbDRAh9
	uKMO7sI2LGk/1nA6KVynwGLUfLa89QdMeivfuF5PAOLNEUU7m2QBcRD+a9vPeKKz
	PIoC3D0Qp2iRBvAk367XPFf2D/YgbkjOtntPv4OuKeMNvO2CSDV+D7Nk94wURLdj
	owAzcgLxB7hrK28/LwFB3U6TndPnrbLOXFCQB47yXPbJxbr8xmKvz8yQ02VKYMVi
	xVtfh4Ww2H1TApkZlTdZsiezi+GV0eBgYFNl2u8JX/J96kB+bp6WNrAs9OIVJxLO
	tmdRm3iQXokwsntg9kfBr82NQQgrHRQwG51jxe6UiyiUvwupzTHxu/R8b0cF8ez7
	qzv+CQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afgqx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so29327585a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924502; x=1788529302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=;
        b=gSy8kC3wdFqqrAT4hVE+gu9rlUPISFtn5r1mqLsSpfpv6K4e17uLglE82ot7PWoU/K
         E+Wvcs9kcNxpTZS9EIkUsyXp1ByGSXdpr1mDwvcg0TyOGtjxVwXg/zdkCBEXoKfwLtBq
         OFRg9zg538znw26nxQ0+OdP6mG5E7WfOEw4L9lFQSEJ+yFNxetnI3WyFzHKSzj9eibWl
         ba6e6bRgDO0aOJek9fXi7OB1K1Ag5VYKErfTkdwowXLXeVGV6BctXdTf5dz0LpAk4PBJ
         UAUYaS84L0Q+eXGGqMZMQZUdUrmqP6aOZd6xluqYxHYZALc34Xf+0hB9Mm5OBvUbVm1N
         /6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924502; x=1788529302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=;
        b=SwB9dg8khmOozZeCnM7WITkVaOkqrkVAvNYhoZwhy+lom7IPXxPXHNkwyqjPkOt2Su
         wIoxYMSSG4rXZrpIZv/RK3OaZAJOESEWN0qBdpOyTqkKZMGUpEUnYXM8TN/mfYHinEDY
         1FTMGvZ5xwBoXrbqzc72wQj22widPGnQ77Sx3Lidn6jue9pCa1uxltpx0Ta0of/KzBE/
         yI7zeqxUGYeRqt0sPfVf4WXN2Y714sZiVepHGial21CK0i5hImgIdVA95ntHORWAZ9te
         9lrC0UQUrpyZkdXRZBr8c9rZHdrxAIqLsusrG631KnNJZLFla+cz9MUFBTfYsAf/rEbu
         GAaw==
X-Forwarded-Encrypted: i=1; AHgh+Roh4N3nODvavA2XjYXPbzMjYfepZcMNqee3nFBptXLCbTaU2LcY3y3/qeCVoWP4RQZ19cUxxqgraouTfuPfKT5+@vger.kernel.org
X-Gm-Message-State: AFuF++lfUMcRyhLvkqBl01tBjVfS6ob9dn5nAIMAj9+e4w3W/DLKJ5JZ
	yf/+lwuEzdkqlUK46ToLfHuVQmnF8VqFHlG/nLmP+Lj/gtOtZF7dfOA5aRLBOD9Dd2+ycUBs+q9
	jiI1UR6lWGJCdhKLXXIDzYcP51/UHQJlHvW9r7nbv1iEHA+qyPkjkt8brRYW2ZUXnYsQcNc2o
X-Gm-Gg: AR+sD134ebqTAqlST+1lQRq6vwdaheD07mR6ZnFyy1U+69F6rfv9xtPLs4ALFcb1azB
	upn4H6e1Mbqde0BrFsdHDgjm6vDHwa3uEFJICmU12iPLa8uEB03NPQ7ejZPeGmm1TGR3ebFNC5w
	7y44EbBK3DNpf1D/cBPFcojXPxcToYy6eOAriNqkr18Zf7vb6+ypk78EzDKQt5PqFqSS/6fBs5d
	fTl6uAt8ZNc7qCu2X9BVb38lexX/5ODOExTHzyvO1R1HfWv/pxgn9OKr1DKcJ4rYBEbmKWnP+Rv
	Itg+nf8FHx2Nve5eOYYcq0NyB5zlPUkrHUEulQ4yyPPhBLPxmUCKPC/FKnAxStB+ezM/i4WIcTy
	K2JS4v5sMA9mlu4YhyhVf8+g=
X-Received: by 2002:a05:620a:2950:b0:92e:601b:8d43 with SMTP id af79cd13be357-939137aa4f3mr479998285a.1.1787924502363;
        Fri, 28 Aug 2026 06:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2950:b0:92e:601b:8d43 with SMTP id af79cd13be357-939137aa4f3mr479992085a.1.1787924501825;
        Fri, 28 Aug 2026 06:41:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm81168766b.45.2026.08.28.06.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:41 -0700 (PDT)
Message-ID: <c27beaef-05aa-4963-bf6e-ff6df08c6110@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 67HdGyoaSXzGETRCs82eR0EO8v7qj43S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX4Zx6l3D/2WEh
 MjuPzIR2e5hwizQAaYYWkmDFf7b/pMwB2YnOMW+scS8ZVJNZMjvtII1H6c2KOxy4/Vd7l0PMRi3
 a5ZV9xhIP/JGXHouk1Z15rujKEoslxM=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a919017 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX10KRCtV1OO8O
 cllyvOQSQZuC4miep8T45NkfqJKMLdMe+k6+WNdZzSdRGptjeNyddMXSaWoibkwktDNwjGjyVxF
 6OeITYvkSg4nR6myVWO4OE5QdG3aJuGpy9PS/znfmMG1gw67YWtiupH+GpotZWMDzNYvfQVasyk
 ehNe0NxxOyMAaRWJ37TL0kxEQAj4kG2Nsn28IAxUbzzU7ySmkTVKnYI3FfoUFVJRsnk2yytQAu3
 J4PjpK11dTrQp3/tP9LfsmhZHd5AJ7DRWUXKVbl5esH0lbNIl5JSfg8JoCqshg4sfoAkVTkZWW9
 KAnh6GRnLM11zGOohBDWUVw7f5k4VKsm3gUXPKEhlPRSQi/BGSOtVd6h0naWs8DtUuKnZnfofOl
 J+BVi6DQBBQ//ZRERF+YG4vuBWtO1+l9Watd+uentuO3+JFVI7+YT3rbKQ7Yjk3T6oMS6G38xWz
 j4ohFgYoBPulZM4eQdw==
X-Proofpoint-ORIG-GUID: 67HdGyoaSXzGETRCs82eR0EO8v7qj43S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
