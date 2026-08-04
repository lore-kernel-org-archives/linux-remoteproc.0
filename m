Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0B45FFD1
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865137; cv=none; b=CAjYYPEnMpIvEa+ozhhpw+TmlYQ58YBAuQ4jUMliBijWCl38Cs3Caz/Zt0/oH2mnZUxlpm3RAS6YqhR7mDiOPz4oqN092JP02CvSk92UvVNwcdJ651AbCF+6pZkbg1f1G+Pyf15gAON72YanzOQCfId8IeuQL2dXfjfGbVHhz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865137; c=relaxed/simple;
	bh=s2QL+3PSUX8WWARCToIGXu835aTMJb1xf5KO5gaCYMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ue3wNyzGCTfrBaGZxrbDZNrb0qfraCO1tgErpexRi9Y/6Vl1R5ZjJ6jGHgRQXmufl69EyduSrzpBPwZBjldWvF6xLNtM6cdXqdEdMucUkoNkwmL7UiW/tkwSjxdSsSpU81OV2bfntqyucbD+mNG9nY3WX3yQfcnCzfiesWKFTeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwnkhZD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8dd6EWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwnkhZD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8dd6EWh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Ffdgg4057214
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Aug 2026 17:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=; b=TwnkhZD5olQv7ZFw
	LK2jfU8KDMR73DxbrsGgbVNRlkWIrkP0qYCBVxHSXnpshrG/O5qetJkt21krNeVn
	EHvE0frrfWnQdps1gwTUpFFrSDyIy1HDBkZgP4gGM72yDWvVlJPLBLk6c1b7f6rL
	Lz6ulVx0PNYqCwUugXl2+9bBKm5Yr4wpgRWVDyI/4UgoCCtGVUzauKttVx0WHWhi
	35YDjMuNogwZJ4vWDRqJgLbAlrk/ODv7G3elbhb7qGcPqcjQlwDHBTqgnaAUt8a8
	vn4YHqq/QetCziVGYx0yuzKfXLoaPw0p0BOx0Uqz1T770ATRF5Cr0Zq+v09kklap
	65ELEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmghd4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 17:38:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso1182615ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865134; x=1786469934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=;
        b=J8dd6EWhlk1+TQWP+FZU1IMkCDSfp9kG0o8mmKttoRhDpW+NiNBla54EQ4niTFU+zo
         UX03OzFwdHXLVifeXR5KBesF7zgHxYAWltfw1XrC5k4uygsrtuTBpaSz2Hwwwl64uRis
         jGL/iTf84j0tmcp5i6/P2WecemYsUMTboDcTFsuC2J8g57UQyboNbusBIbDjatRwf8Yh
         BqJo1hPqkFgccIwHLznxDMsyHuVppvrwuHpfU8PNhEwi5Giia9zkOSKBy1pDTz9iS6Ub
         hlvdvHcLOhCbu9OeCUF7mTN9Rs+SFQyiYdRigNAkj0EjPC9K1QrdqdHvwGBzJdwvkTeL
         sRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865134; x=1786469934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=;
        b=iJU/E2ulBEqhuKc6fAQWdeqAP6WrRpjdAnBML28AviLcVspksnPdGUGeBfAGRlEz9y
         TnXuBCejro0W2DvfSIHYAsnTi/GYF4dnuZbqZxtz5mPrNJJd/Deg7aOfKTJzUHaNIRpx
         0vTMikOnKYNXl4jhiJM0YMakBAt3TdqfcGZTzLplYTYuiGsViXUaeJZvtWgIynWbPVsM
         6uEXbglB5c6iDNSRbAEmH08Dr18+tPOS7frJmTjSTHTgTh+dxd6k5WJdi2gHHDU0t3Rt
         jhk+XuK1JH5zv2WUsRiYU+bz73dOv5RixvCf/rXkSa5deMN/4WDnNtASdKA7cgKr1D3P
         nBlw==
X-Forwarded-Encrypted: i=1; AHgh+RpBO0rhA7oqwdZbZJtBZ/frJbInv3RFcQEz0fuBGHowc4Epkg7h2pEvWD2/KSH4EaoSXChKuH5h/WgwMVoxjcDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0au/dMol6Zkyl+hM7i10tB7Gq8V/6BBAdJm6Kn8bEosDRKGUP
	5mmMiOlHI1XNCwCY/zpynTOEMxCIBS2GqWWk2nqOIRKLmSlWb6ZvPJK+poAbxw6By4W+Cmry6mr
	j/9lnBo3BchSwQjz/Yog3xBV9Szr8vj1vaUeiBUKy2XxaKfmTu/pGo+usAMFTvHTox4IdhcMJ
X-Gm-Gg: AR+sD13Qh6F+N0JAx0OgXdIKw9SGbU9QSHgTiGSTOBeAuYpgG4e7kuQCbSUe6ABoxWf
	Vu1NhOVqBf6oIBT+a7RzBdPB6WUUBDEcMynSTZFe05Gu2ZlyZPAdGE2Zpvh6Qehn5KoYhDlDVm6
	WMfjsBtmUZkVKAkTkMO15zk1hcsTm7K2uWWIKKXVs+IRkTAayNa4/Sa77znCsZe3JHeZM+N906Q
	jlyV5455qLmmsCvqj5ns19T/rCETBuGk+2chwL/f6AaTUCqk9Prvi2LJP7ehFTS0yviaSVv7361
	5OUoke4Pe49V1Be7ErgCK59XU2Yf5d+FVgvQWNYUyBtgsiYd6js+kCSY7za0LSQOTxkA0K+FLKQ
	PTgTEaBWN6oE3kNY1/CMLij8rpvN4D5NCpQ8gAnOiVkrypm/RsYmGwS3jGmNv
X-Received: by 2002:a17:903:4585:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2d0ca961ae2mr5638285ad.24.1785865133867;
        Tue, 04 Aug 2026 10:38:53 -0700 (PDT)
X-Received: by 2002:a17:903:4585:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2d0ca961ae2mr5637505ad.24.1785865133333;
        Tue, 04 Aug 2026 10:38:53 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm10441282eec.11.2026.08.04.10.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:38:52 -0700 (PDT)
Message-ID: <9387b504-4506-4066-adc6-7ea73db086ad@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 10:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
 <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfX5xksRN3cnkJA
 G46E4GJN+1Kxxa6xNo4gyIAraLR32CQaRhHq6InTI+vmoWbUlywN087C4B3pkr7vSK3VQBZMKp+
 DhnPL+89iE+nKz4DZyycwi4Q8NykHKFXtIXU5e62m8ZbX5j2dba6ZKg6Gz7aons1xMdC+4ctMUx
 49bkG+JM95MSLJtgSvzvHgpEu+o2Yk9EBmmGtfs8eau3xy8PWtMsSNO0nBVt7l9r3jU/rlvrhkX
 k2WIhhti1xN+F3zaMCpSe0/j6Yj5Wxd2woSFhczzynKlDl3TpvfbWgNyNukylHzqX6lw/wIKMoL
 TeWRIV7MaasIVDTPw8pY5R/Szv+9UcoYmFN8YAUw3A7uczrn3vsdDwump7ch4WDUbc9cg/3JXxm
 7+ti4I6HBGu771KYAP2f48l1fMAppRcPPwwJB6vtEQ9ovT/ZRqAY4z4Ms0oGOZv6gYrK1oegSpQ
 dhw3LqkOQiwZxpzn2Ug==
X-Proofpoint-GUID: qfcKv4-D1oGJFzO_lzhTtWiUj2j-NJlY
X-Proofpoint-ORIG-GUID: qfcKv4-D1oGJFzO_lzhTtWiUj2j-NJlY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfXwZeuANYp9Wec
 eeXJlI0tUUOA1ioDPudRcg9xGITvAj+NY36/BAoOw0CutjMN/ojpaX/sg8D9Tu/kCsCdPQGmcCk
 xeoVGFDnvL0+LpRwfNgqbevd6yGnD04=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a7223ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=855XeEJFKU-ae8dwujwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040142

On 8/4/2026 4:23 AM, Varadarajan Narayanan wrote:
> Mukesh,
> 
> [ . . . ]
> 
>>>  	if (IS_ERR(gunyah_wdt_dev)) {
>>> -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
>>> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>>
>> stray change..
> 
> Based on AI feedhack changed %ld to %pe to print PTR_ERR.

That was bad feedback. You just want the number, not the human readable string

