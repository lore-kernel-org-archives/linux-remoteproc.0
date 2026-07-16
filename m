Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA69405F7
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215022; cv=none; b=H2JAEu/UadKvIX78cGa3lcpQbFwE33iqI4F8uim9C3sH8HZaxw0Sha9wD1/gt2rBGQyDnT8nWW0hox7uxJegZ0Ky8NWc691rzNAnj+jj4Y4oscNNSGG4Fz3DEPJnsIOXAxjzH0LtaUGqJ9TfJsYLzjhK4dBfZyDu349XUMw+0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215022; c=relaxed/simple;
	bh=Kt0kHWeOa2pc6HHNAuTm5CmqSOse/qvukTWTXllpwys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MubDfwQRdyzK+b5qyaDmVJMJewcsecGgw8SYs+RH9fvTYAUfmaMvM5nny27kW5g/1cphtpyLjzpWmH6d/6WvzAAjQaEPOti2JsJXqZDUO7QqPtucTBjjNh00ZJKH3uH9sM0fspVkN6wBak7lzzVWJ7KVf00nIB0HY+MUjKY7FTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIsG68q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpSxaZD6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIsG68q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpSxaZD6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJs462734773
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 15:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=; b=BIsG68q3sOPos8S7
	4l+qmzIBNZrp/ZOfLZUOu3sWF0E7t85dkMttaOR/Ubd8NVZNJHKJHYlIMlBSFJAb
	5MeTcJdgJH8LoXJLFS5T1yqlG2v6kEJC7TNc8rmaLfbWIn9cQVYe5YSwntKWrflA
	Z5Sd2owNJRjU9Pkz3p+kUhLT+A+0E1acYQZaUsjf7yCcr2i2ai2yJlUZ0ZT/o2LI
	lbATLjetmPPEycnvVXGuNmU892C6K//rRhToC6FfDLSmZMykev56ViSh0+6sgyGQ
	Ahx9+lnxEQ0o4I8Di8mWhI5SMM/TJV2pS/hKBJRRe0y5ELBnZjTazIAhRHpxDa/0
	n80WLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1jau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 15:17:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eb5f54b6dso131116685a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215019; x=1784819819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=;
        b=fpSxaZD6Qlfpg0OVtI+uh5NRvI4wEbaLD/B2ZFrG0bPdsJbt75OnXhR7OyDAqOeYA0
         knlQ5fc1cdC6YuIKwl2pzkvtkUKDe+UBN3nBpFEYqulsvGUKLORZGlGyHnkfsrZ/pLLA
         QF6k8qDRhirbTfyywRhVUlWZr35NqQYPq/oJmRsr8w3utDMp4NgTUb6e4jSdjFKagpgp
         3UUZTCVCc6BlPzETL+2Ya2vsR8wQPUaHomkPRRr8kosgPfhljPeq2030A7jFuu6y5VDc
         s5ITTqZFW3PYvUExZEUuKrFJr9xjW6jaEbEQ6c7U6ZlYzviu6zcheSSVfFvIYM893h95
         tInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215019; x=1784819819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=;
        b=GwRDoutMx7kkad5Tbkrw/6iPtn4WM/bRH1BxWfUo+JNCvTRwMi9i3r3hVim/JnGtXW
         0uP1sROXQG3fsqDhpIrrz3/ZQPnhM95oYH+NYo6nU+IEsR3P6wGcVur8yN55aYaZWBVe
         w3VcXsv6ubUP6fJkUXWtrswqhyAYaaPyWm5+cuq15TCbdL46OyTrAxsEUPFe4PAmhLXk
         VeQW+dfU1l1Kr+1cPPTm5vpq+otGoke8pVcL4dGsmJglWGr35vBa0AO5GilfRX6SWm4q
         TuDy3CFvulNlLQVwpDLlU2VkGZH/I8O7/+iB4e6B2fGIbx3siGONjuS4VFecjx+tsh4I
         FUwg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8D9OL+/tgETDjQe5Y1ORFt8pd2b0cfCBgfcniH77mHBDI0QY4b9mq3nDI0Tu9jvSuFRPBxDgho3mxQMmbmc8U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsxxms6PnSlz2NjyAWrHKYsqstDn7N10v7jzmlwYVpO5P8Il1N
	LkyuKMXSBCfCaqS/wNo9ZDY6wMDxh33g0eEqn6M1jTnq9TzYYniWyZ7tmhhujk6bPTFz+W0Ehk1
	LSRACzZJS68ptA79BV1ayeOln/2hzSWaCCZxyBu+3Wrr5PmjPsX025cikZ7kScPWrsLfXMt4D
X-Gm-Gg: AfdE7cmggft9ql6GNhj9HjqJY5DAOBwc9W4wan27WlPE/UMFCUzdpRcaiGNsVqsFYsi
	fMaaO65HvbxQVEYhV+fvctCvFTOWTygSI7/iXXqy0z0rTorTit7ugpAErw6tKTGOOZPQ4uIlc8y
	aYtwQvUeJ0F93Xigs0LYix6kxtMXZMzUzYhxC+Z9dLT+xRTPKdIqzkHQv6UPhH4DIkx1VJHtJms
	qZoKkDapzBHVmztis6d+CGxv0o2X4s8hPu+YOAUXzF2MNHVr0DYAqVmY5//1FX8qKN/un45Pl5E
	FmrQCmElF1xVE3hWnR9pih/gBRxw5cpyxHBt3tOyaZacDp7cZmZ/WoxF2TfEeeoR3pJVUyuh8Sv
	demeS5CMJBB8aaR1XlVXzX3OH
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr1865661885a.7.1784215019504;
        Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr1865658885a.7.1784215019078;
        Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871264basm238140066b.7.2026.07.16.08.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 08:16:58 -0700 (PDT)
Message-ID: <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX0eB6MsQXeJTc
 DcbYn4sV7bLd8l7OMIIsKXVoJI08yUUKWQ0GIJHOjjoVzPVmao4Gw1y6H7BNpX8TXkcztaGHko3
 fhxZH4vUVWQ5QEXmd9Vl4Tw218ehvvxdFwsuBMDmQUjfUex8D57YaAFrSJW+WLii9ZYdZqgBo8i
 NHRI7EU0Z2EcGHZ3EXrEi1rw3js8tV8cJIIkI/z7ps602UnKNfdSiQjmHmr16TLrgD7IaDA8O6d
 F74hWc8NdJET/7G13oZCUvwjiiigfu9qRhuHwD0+CyS3TXHpjK7raucLMn4Mzi2DzkGvcGc+089
 5YWXkNUBmmL6HiS6W6okRyNOMB87PElqiU8kScfX21yBHbUo1IXrLVnpmdegdtGjBvwDnzWrvCv
 pRYxvwPU2P21vlZHAlfNGKbRGrhkn/v/f5C4bQs5oGIxvx8scX4mbmgz93AdL+VK7+JhSQhDfOO
 aYUc4x3n05vtVH9pMxw==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58f5ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5FnEwOx_HHoQhKJlLkoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pre775O4zBReOoR2Rtiu5QkGLyXUPsv5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfXynaLoD779SYY
 oHJs1ikg5R1DplnNDx38T0PECmebrg4rHVHu/hx8WeOzDEQTGFpYCMeso9X3EmJAeW8t/C8y+iX
 /i6MEUjDKYR3U7BFYpf4qRSyOlIi3Cg=
X-Proofpoint-ORIG-GUID: pre775O4zBReOoR2Rtiu5QkGLyXUPsv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160156

On 7/7/26 12:12 PM, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..9ec7c256b80a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
>  			no-map;
>  		};
>  
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg = <0x0 0x892e0000 0x0 0x20000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg = <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		soccp_mem: soccp@89300000 {
> -			reg = <0x0 0x89300000 0x0 0x400000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};

The updated regions point to "SOCCP Boot [DTB]", whereas the old
regions point to "SOCCP [DTB]". I'm assuming HLOS potentially loading
FW to the boot regions is fine?

Konrad
