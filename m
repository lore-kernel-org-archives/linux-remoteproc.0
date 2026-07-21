Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C14D2EFD
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646611; cv=none; b=b7OaRmvD30ASsxa9V23Clg6k5MUOxJCmW/32vDVjqT566s2yh9HLlvpGz72nxk9X/YPBpt6X/uC/x3mcKW9uayHr9YYfm2Ixo9PA8c8imWHRZ4hcs/RqCIa9Opl1Ebqz8ZFrj73NQ13M71GVty5zZz2hjLZj6iSC6QphB/27918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646611; c=relaxed/simple;
	bh=osUi5ANQSKW6zxpnFDg4GdYDSPknTXsQi77Jpa5yPUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLVKF3uY8Lj2AqgnrhHuyG0KXO+JK/ZiqYECVbLh3GiUmxh8hUwVkvwYe4mK6gLjEiuX0eTLLvY5az3GFYSv94gel5yz1uYkvT8RSjTa/e0gMpdkZWldFiuy/LDGZNifRbgLgkBQnEVwii/oPI1wnGskO+tbY2DeZNR/4IV0GXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSpA5Fa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auSu1+Ck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSpA5Fa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auSu1+Ck"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6XZ1707990
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 15:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15+AHTyLjpbpDshovEjtdc1p7nuqFsEDH8IjDdAKdfw=; b=aSpA5Fa8Al4wGSHo
	6i3Jcfqt6ps1SZqAz3aRiHcGX17EpL/D3euvYMUPF70+Qaw8ZI2h/Ropbrks0fiD
	2sjH85bNY9w+RJS9BYWSf+sL0+918bsbdh/D+4/Cvvo0/bfOmrOlFHXBQvlGggNU
	QjCyOOHdeITwIsVxaGWJMmGp2mMwN3q3D7CwniDCqBMLIfgNSaiJ+tOIkz0ZAZnk
	RRDod5MT4zIxQJWWoJZH4F1876OFKdpOCm2ttrJTws8AbadiuyB62A6ZEITRdBX8
	lgpy2nnqyc8e0AjtH8I8SmdwjjLomSGMr5lV6j4x2nnW+HMWeXJsF6EeO7/mz7km
	jy+ObA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae8mqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 15:10:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso167236381cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646609; x=1785251409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=15+AHTyLjpbpDshovEjtdc1p7nuqFsEDH8IjDdAKdfw=;
        b=auSu1+Ck641h887TA4W69hnuoG6AfX0P13YgHT7AEpFlfJZVyfZM3nU4wr7RqkFfPx
         /Yfs77qKQgXi4v/SAXuvEnnsoNELI6WAl/QV5S8yrBF4SNOa5ahplVqKqSpkAtx+SLdy
         4QGTMBjrzKWiK0QsP5a+yvmLX+y1XW7sYdt+8MyALK1wpw66F4qadxh53vC2nmaZPQEt
         Evu70Yz2lRSOUDn0hOGdfuwPjnPBFZYl1XUL7PnjO/KDz/vs02wxuEP9ATuK4HJE8orL
         H/M0EZr9zvrZZ2BODWMbbl0jLS/UOOMycxdK+f7QwIde8J1txuws9XPJCCmFysiCB7FG
         KMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646609; x=1785251409;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15+AHTyLjpbpDshovEjtdc1p7nuqFsEDH8IjDdAKdfw=;
        b=f3wCTovUETqoWT8DeTrdjBmPHDwzBpWWk0eFLGxu9qGfB1CkekWWXOIOClpoG2lSzW
         GApsffghVNNIUKWjqlpoP1flFeGRbXCnPRTZLLBS/T+gx1dxmQ16hGq3MIvHM1PNy7Lb
         gQIxMAIWqyoyGyGP//KquV0csO599bebsVgae5OzUJXCZMsGPUrIG+EpQGfahVMGkR2p
         sXD01TnkDXjvcS1mfPphbvOR+Cwg6q1C5qhHCVggW3afNk5sGC/r7VSU9BvbeEYXfSag
         Q7GYklnmUgvC4E4YRlATJUGTE9wqf/CwJZjOnfuwkA+rvgspQ8MP1Y3Jak9Y4A7K+9fC
         2Lww==
X-Forwarded-Encrypted: i=1; AHgh+RpRWxr1V2ne7/0JVUJtjFkt5e6QGH8/WhUEdTVCLfVtbJO2r2Qku48qbO6LBpCjxQKnjNRgbg1JhB5swhpOIMxm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3iMYXFNAKr8DLHr9eTiFLR9PrKsVi/zF45EpLyx822UVZ2DyQ
	D1DJz7xA3NzFh6XxyCAYKqPfO6UzJnnoywTF8naqaDQKEkZ1LVpDomuY+V1GsiWaTK3wJH/3Pgv
	1vnHHbgKzq5j3Rkb532sCw5UZZa9BkTrlQOe8zH3yg4bdvTJTZ0H0cfp0VlJIiN96/DTWV+PL
X-Gm-Gg: AfdE7ckuV6q5Ow/uzbBdedaVK9IkLYyrZ+FDhkCvTIzSoz928i4xChduhkdna28nob2
	zGI5T3SK7fNzCKSNPolWfDJohvu4pb1taNXXQ6kVRHOGIEtXf6ONEy+2xLKsH3R9bK/kG5lPCp+
	DLYeKkJArGdNlm07VAcwFudY5qlxZttL2bB30hD+dgHYaqC/EhXvPjdiuxkMNdJL8brbbvnr60r
	FZBaikRWS7O3lEuQVIiSmo0Qhq8OaeVwzxmoIRIfBCVJxIMQiiARanPy4ecJEua9HrJ+Ugxl40s
	PAyLSdhkBXJGcjbHJLjnzE0GSAfQqxlZ3uspIhb1TqudYRH+nmwbd/O0rzlVUEvXw7XDyCRaSeQ
	6QdoUsuWvt9iKQVENF2XfMG/yeJlWLw==
X-Received: by 2002:a05:622a:578c:b0:527:8770:8a51 with SMTP id d75a77b69052e-52787708be8mr5190631cf.47.1784646608705;
        Tue, 21 Jul 2026 08:10:08 -0700 (PDT)
X-Received: by 2002:a05:622a:578c:b0:527:8770:8a51 with SMTP id d75a77b69052e-52787708be8mr5189951cf.47.1784646607824;
        Tue, 21 Jul 2026 08:10:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49564011868sm88085495e9.3.2026.07.21.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:10:07 -0700 (PDT)
Message-ID: <8fa3cdf1-dba5-41ad-9b1e-dc5f77bdc284@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add fallback compatible for
 ADSP remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vHiOGFa8PPTQsLlot_4ld3awV78RcRIy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX1q49U3eBq8BZ
 ADv9snFvz539evy17yWdauMpmgGeNqc6oqu2/eOcjOebNF8giE6TsjF2ZDrfUw1OlEOmhWBj7r2
 tZ5Lfjd6s/phmg9lN3PTOphr0t0wiSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX+acoO7lmqTBd
 gbFGNX4b/XLaIaFp+IKRr60kA6dnjtIATCPy2Zk69B4BXGKIBq61NDZPD3aw8KRugf8USbm7wG8
 a7zZZIFm+OmcUhMj4Ud/bqtWwcakYMHAqxCFWUfpigFwuniZwAyZFtClq8EjuO1YE7UnQddPzdd
 i+5oqNYOztUvwXoIT5gVCpFxCO+omLVP42hh7Lq8NgXQURoXEhtW1xfKWIAumBVjhteZaCGCL/3
 qLm0aHWvI5rRpxr0AtW5tq+uxWqze7knn9NeAEWfWSszgCaNg2FSzI5hv9RvwbNFx1XfXAfdzav
 mmZl8QopMtpkkKjpt+KOtFyX7l5ijSYSX3hZ9eM7S4W334jd/1zHugTcyEeeM1lo9xtjIBrCjJ1
 dVDbCm4usajqo6F8rQGc63xKMahf87PuKtu7GmG/p2XGLP6w7NTSPHu76WejCYJfsHe51q8Z3E9
 q9WNgH63qsgp8KpP9FA==
X-Proofpoint-GUID: vHiOGFa8PPTQsLlot_4ld3awV78RcRIy
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f8bd1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pKSKXMcIEd6FydBdNeAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210160

On 21/07/2026 13:35, Abel Vesa wrote:
> The ADSP found on Eliza SoC is actually fully compatible with the ones
> from SM8750 class. So add the SM8550 compatible as fallback, just like
> the rest from the SM8750 class SoCs.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
