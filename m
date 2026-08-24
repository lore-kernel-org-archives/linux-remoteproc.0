Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7CA439350
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581018; cv=none; b=IBXs0JF4LJag08t1aFSa0pPhgpPTWVUROKaaU5eoFphVNSudcP3HNBz+V0zouF5dCeTmEVeMn+DDhSMl6+o5xklvR0SoTKrD2MgiVeZyUO5Y5nq/mumbQyXb/S/gHY/Rkm3/3e+KBXiqGxfDgaS/2vWJg+skKYYmqDBm+CuSZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581018; c=relaxed/simple;
	bh=fuz1AwDiVrmz2H6qeqwqyHnsETUV/yZMakfR4Wcq4iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZem7+fzfjEXDbf1bsMNzQcG7m21YOhrTCp5d0CTqqvB5qq5+D86ZyGijtEeXvNF+dWcPqdnqD5S6TPFJ28uQumo5is3F+l+VHs646m8/55VN6WWwxNiSH/PbhtwKNSe4+g7orWCOt1IkCBVSmpKS1ojK+LhjtSetTxQCok6KCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUykcsMl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbe3dMYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUykcsMl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbe3dMYu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv52R2006638
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=; b=gUykcsMlJeSHlcUm
	/1k6rbBHbuQ/FVBh1Y3GazAmQq3shBdn7oVi7sPnJgLdyxUqwrpk6e0Tbuz74jS0
	YkHs37ACHPQ4Iddobo7q2Cmk9f5pr6/y0cZ5ICn/xCaLKtTmbzcitfnB38S1v0Jf
	J43vMfL29dZY7SC9g1200OzOBWTo8v+dPwAoWnmNqXY3+/LqbAj4QPocFZuWtRTo
	D2WpbNTrijfQhD5yagBvG9YrDrS1G7L87cefcJgYxolOhukN1fSgagIeUEXzs4lw
	w5+0bXASnkEUU9ohV+6ZLaLMe77fUsxmNheJ/k85RMHomwFTtWy/RcxodXaNZTwB
	j1AlvQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv79001-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:16:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77969cb40dcso59710137.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581015; x=1788185815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=;
        b=gbe3dMYuR/Rnfg+5bhYPYCN3r8i9lyPVVTSG3XqQPuT7gMoXX4h56n+4p9AyAjGcZ7
         +hIesCOGkRGDLkkC/9uYe35lZqgSZ1cHPECTbovfKZzOU/GozrILgBXVDnRMQWWanG6r
         Z9W20HvXBzDzOah0G2tkZyEJkF5niPvy62A/ABTcTwcGgSoqrDcOl/Tb8MK/3wObBhAO
         hueO+V/LYl6jrEKPuDAWz20z64ljzK2b5afR6s96M8uo7SmVzp5X8pNoil7C6tOrVPd0
         l1HwbEw/p0pIIrjAx+SK3FPYSBqo7aPyha1/SUMh4yECUYVYOZmfkpyuTwv39D8mMjqy
         9GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581015; x=1788185815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=;
        b=qUsgeWxvLpebcVIX+qrB6vbRINaJEwi9vxpsg5irL5BUm30gZaHNK7VMY3AmI6B5Jv
         L61HQ9hhpk7BrWXw39LtaBEQxJyZktreO7263ILjlXzwF1ygtaaue1eg/uWytt/dFgSn
         smro8THyNZ1mScCcdkvTVtLhkpr8qXSRTkIkUdTuptnu0AN2n3CClbmtK+vGAj3iAbcb
         tG5KLsNcLob2bDZkydasQa0WwAqqiGa8/U6Sl3Mr2NDwnhRVq2nniMBDCt5Q58Sqt/Vw
         1s7Utvo0919ZIPy+UBXgCEGnH3IZHhMK2sNn2gDu4z0K+TegO6oSauE+35SuykTz2Toc
         pJfg==
X-Forwarded-Encrypted: i=1; AHgh+RpPZ2BZzeBMNoQv5RU1d1U95nLsbn9xAt/F+UOzclnbcNs/N5RobMpUimUEmr/k4tfCo06iGvNPKmBrLchLjcxF@vger.kernel.org
X-Gm-Message-State: AFuF++k9Yd8l1Ab8cr6hVLiTxr4y2RY6BSukK824t2eNo4SuZNz8xzaL
	hcnVkULEobEoaXbhuYcsAexqlc6G/4lC0olfSGew4VIw5TIARhcMXT4bxblbgBSBHd4A9T2DP1m
	9sxrtLgagRFVUg/RaRB14nml+hoK2NojfviV58pCKiJlv0VvJsTMx4k4hCu+4cLMb1LQp49LS
X-Gm-Gg: AR+sD11I/lg64wmxTvWIAeHK2gwoFcVOaSppkh0NKhhtrPE/q8uVfNAvkJpzauVPY9Z
	PyW55KJ5F9mgZ07MwbSU3NsLBlU5CFp39S63TLc+aMDyXafNh/P+zyhkTkCcBnQSVufCFfLgG4A
	CUdUxqjjjEok+BDMYCdI9YVw3g2a3NIUVQO1CNv/rrDqPKJsjhZzCy00GSk6Ihg2x9HrwQ3pg9d
	zmz6rVVBk+9EiZ84uZpMjy/0yqHhpbK8vGDFxzG35qKOASKtCI61hzEJQ/BLssR4s0LLb6JiCl9
	0UxGMUG0vIzRAvnwMmmhyEOdR9SbyINB+Ht6b9Oxez4LW4hz1ft4sYSekwrfLj9SuysmB/J8yXk
	T839A84g2ip5esSxgiS1hfCdH
X-Received: by 2002:a05:6122:520b:10b0:5c5:f164:b3ff with SMTP id 71dfb90a1353d-5c5ff7b3acemr3109763e0c.2.1787581014738;
        Mon, 24 Aug 2026 07:16:54 -0700 (PDT)
X-Received: by 2002:a05:6122:520b:10b0:5c5:f164:b3ff with SMTP id 71dfb90a1353d-5c5ff7b3acemr3109753e0c.2.1787581014362;
        Mon, 24 Aug 2026 07:16:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm10832671a12.1.2026.08.24.07.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:16:53 -0700 (PDT)
Message-ID: <993a82a0-875b-4b1e-bbd8-05fcc576cfa8@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
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
 <20260809-b4-qmi-tmd-v8-6-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-6-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c5257 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GSCxQli8HqGggX-HJQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX/gAMgVw9ltKG
 gbr0opD1PKQZPFVtGcA0CEAZOwJr7ro3UNFCGF9ATF3q7hRTJgHKj8dCVUUwcpHc8+J8sk+76x/
 uIypoby2+gHushZE9NxTtAKfjBLaCmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX31Cj54i2icbP
 x0P2EdYoZ55t8DBVlIsmRaWILVKZfkh4KAR46mGmSVpixap8mGA6G5vLXD4cgdS6O6H/WQPRHp5
 kNUJyicfLlbLAX9e6rjGgssuj7yl/vq2Ne3d4XHAuitjS6h2i+97VMTShHKHDZ0R0bt2AEY3dk0
 YLUfec6/wrx7lR864xSCL2TCHqCgXfSQiKfA2FYzRRhqMzZbKxIykOMsZhxgf4x+f3kzhChLCRo
 V8yPcAyfAbKwysW+eeBKkcOiJI+Xyv4oNP0V+tRu5MW06ggcN1ct+xASJ8YvocpRFbcRlnPxfks
 W2eMks30a08bBeo+GJhyeZ89vhRTOyiLRbHW6tUTazHu/0Dx/AbMh4V+3YWNEzVd5OpH8atVDbS
 T60S0OOE/OhqgleR6KXse+c1uitD67Ey/rXi3rpVAFTxZ0wv+bI3v4bQXldPW3yQfKJgP/4OlyP
 PEvXQEZwPCtmp4scY0g==
X-Proofpoint-ORIG-GUID: RepeP-dfiycEsY2GxxccCPNpL9Pepq1N
X-Proofpoint-GUID: RepeP-dfiycEsY2GxxccCPNpL9Pepq1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> @@ -8760,7 +8765,7 @@ nsp-0-0-0-thermal {

P.S. kodiak has polling-delay-passive = 100, lemans has = 10,
any reason for either value?

Konrad
