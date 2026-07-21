Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B171446072
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627036; cv=none; b=K+iYQxeLX002dxy4r/7PFzaYrLqsb7ZK2iELq79HK5z2fV9Y3VGhdN7bvHJ3JKlok0ybLk8XKFyejLOccpzksZyjwPNz/IuAWK5oTOGrs+Ib0U+eQiSAY9w2DoXziqtiYJCpEO874p9AnIRUL5VRSOCeKjvJQNPnEkjc6/SIV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627036; c=relaxed/simple;
	bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tu8tFMdWRXuBMwKRISQM+5Qfm4iww+Q8e/r1y09oSrgT2JD0LSqJdX4bzJ5prfhhWK3yTGz4Zr7ixOTUTHGLwcy+EQQyMx/aJn7gyN55kAEczrhAPBW9kZFWR6labGp1ZifwdPI36se9p9gu74JCtjpNXFt7d7Qbp/VdztKxQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM2zE8kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wl+v2Z8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM2zE8kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wl+v2Z8L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8lXgc568563
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=; b=WM2zE8kxQRWUGbM6
	b8ChIWo+2PIencV95iUP3LDCZW0ICNsFZJ7ZZIvNecPRy9PdyCOuz36JXnA1D7xy
	7o4vGF4/C6eVcPXyNi3y6oj8aTtcJET5VZ5HPX+jU4CTRR5HrMlWTRPWl6IyCEy7
	7ISYfj6JBYF9s/j8orn8V06nzDldBgtH9W8J+u9Ptu4kuQYni/cV4CMFXPip2G5w
	zUBOqn6YRLfcAZOLz2kalYqklx93aFH1oWKVSxbHTgJVNPkDByOm2ePzv+fMBME4
	AaguVk9mFaLnXS6BtPTBEeLuS0dK4tTUAJOn86UVJXSclB2OhHAb73AWB5KR/8zs
	9LmcvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvsjnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 09:43:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so224677531cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627034; x=1785231834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
        b=Wl+v2Z8LwNe4G+g/+cx19uKuXt4t2Pi9bSTo1RDOqiMjNhTRHlQot6BTUcsadIjZpQ
         bq8MerYjz1fQE9k8ld4OP/Zwi3Y/JfxMN5RSF4b4BJ6u1vbih7shKtAVuo8LbywasoTc
         Mlzml7X3+OLk9js3YHl/YXsrU4QyIlAGS+yL67IjsyANP+xNYTsE81dgui2NlBri6zzc
         LcDYAWbu3IHZALZmpy7kshjIdvszfS6iWA+8MDm7+hv2QLW96zrFa/Q95hTQDBYt+pVW
         fWo//5g2e0V/NMbsh+xxhTAL2qvhj0CHhEBeegWNHEPyQyGAZBt5XQqnDKd2rOdtm71Q
         h/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627034; x=1785231834;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
        b=oVRoW8ezFz3QB8AKS5uA81ivX5tK/XlUARsb3ED9RIy1LjlbBvxQ45cTB+4W8mJBiW
         sl4AgKHVOMxbyR1d86T6QQlCrnoymPWDnNlHg7Mp2+MIjIPA/8heJgXtgDiDPXW90yX+
         T0u/H8fJ+8ourW/6iL8qyI3vE07cv9c9ASBEZPuG4lQHNVr5aUcQpHdqunIGBcNVBVIE
         s+80mUek6bNQATDiydkJq44b9rZrgk2oTleyIpBc7DtMQXTtAjbsiAOj6KNELOQqRN4s
         Jw9xfLLFPmMaaqD2pAhInIYlC33bc3t3nYaUhRP+KSJI5nI3IGxwbH/ATT6H+y9MivAR
         ps3Q==
X-Forwarded-Encrypted: i=1; AHgh+RolZRzohm6dHl1XXAYvc8jwS7jwD5Twz6PiGPKiCSK2PH6r7dhromlA7evX/75zZp912V2LTqd5IOdy/Njk03jF@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/GZNUBjb324alGz9C3vwNIZoQpZmE6PZAztSgBHFHX0O5isw
	dTA0l3eGMBAqdLHwU/nKO/U4REFvzHIViIRYDX7B324VolF83XhvuU6p1zgzzqkuzsu6nStjfto
	4/AlI/LXIVlCb7aXj0QU+eq31fuU2iBSlnsqiH9I9l5iL5KmacU6PlGw2lQZJGNP0Jo7hdrbj
X-Gm-Gg: AfdE7cm47DJAfFFoTIyCHsN5ECIz1NkcfvgpG1S/3YzuDCNmaugAjxDMGIPMUOqnzJx
	I0+0yHHZ7osZG+K1vqveEddhEctUrrpaSjw/Ts2DXaZ8Ac1TpGyCuesRZt6SspjiXQW35pMdxib
	rlMhYc6RrPLYMsWQXDVhrF/OYlCnCaIWvn82ZnlQ0o/RVwSvXH2+s5OBQSFkudrNhwg1bpN15wm
	Ro+fbNnwrFELWxAdiXL5sSk8qQw13AOihVWh+Xfdc1r3jtGzaM0Jwz7KCXAqmIdqJDDRM8+2oac
	QOsK4IIpg1L2AWIUpl4areF9bBCEXgKvse5VEXdbTvAX/0O0WQESTNrmTe6A6UG6JuEF2xy93Wv
	TlMnTNPvIrVXpmaCx4dUQbToCPjbFsA==
X-Received: by 2002:ac8:7f8f:0:b0:51a:8c9b:649c with SMTP id d75a77b69052e-5213d0c5b54mr163989311cf.64.1784627033922;
        Tue, 21 Jul 2026 02:43:53 -0700 (PDT)
X-Received: by 2002:ac8:7f8f:0:b0:51a:8c9b:649c with SMTP id d75a77b69052e-5213d0c5b54mr163989061cf.64.1784627033450;
        Tue, 21 Jul 2026 02:43:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm40615744f8f.21.2026.07.21.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:43:52 -0700 (PDT)
Message-ID: <19f5110e-ba27-4599-886d-2eff6d3f8b8c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 power-domains constraints for Glymur and Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UiXdjkGJW-uSkoUyzlWgzbu8PB3xi0MM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfXx8n1LQ6kc0y0
 zT+U+5MD1KlkpiwktxQLxVk4HUkow9DVQsNMezHSAmfoMZTc1KMlQ7afGo1+9wfMrJH6vmO6zx7
 UN+vgltgPBD16vgOVN8hWxziAotoEbw=
X-Proofpoint-GUID: UiXdjkGJW-uSkoUyzlWgzbu8PB3xi0MM
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f3f5a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=5Zs7ehh7ZNfAQ31CW3MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX1WoXH5QzcHrc
 KxLd8w0RHSODvo7h2d4eGUq7aXfrHizD1TT9NrqEzfFmkr3w8xghBIY/lNYCWkbNB30O27Z+U6y
 X1Hkn2j07NgVx151OH9LBkFK9CxB5xUHxvdNWWc8n8Vc0BO4z7eGYWKhM+qnPbzGGKutK5EiDFl
 6Ns8r+hM2TDm2s5hNz8/vxf5rwtFpd2eRGaa4mdjMde2xkBqjeDLN5DSxeop1ndHdpUViiTSYeh
 0nBXU3RYDWu2CGmf8uT6cp+45CXgpz5FBq3V81iykAs5ShegLI4ryPF5dfHB8tJNcMwC2NITHdk
 wZjH/hIGtVpsd9P3Am/dRTZwmbfFXUtxxFvs7O9Agv3LolcMcg00UTDLNVB/Vek0I7e7Ao9sRbi
 Ftr7x1H5fr9Xmkc5PQZGolFkYlzIw2H44z6YpD684xpbDYDhHys8QhfKyeD1ABbzl5P14fRTJ/2
 eu3lLmXJ1l4gjwxuCtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210102

On 21/07/2026 10:47, Krzysztof Kozlowski wrote:
> Add missing constraints in "if:then:" block for power-domains on ADSP
> and CDSP of Glymur and Kaanapali Qualcomm SoCs (rest of flexible blocks
> were constrained already).


As Sashiko points, I missed a piece and this is a redundant change,
please ignore.

Best regards,
Krzysztof
