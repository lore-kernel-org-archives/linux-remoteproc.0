Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115052ECD14
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510081; cv=none; b=Pr/pAHrw1mqzAO92/kd2R5d9U5WCKx1+WxibU+7QvurLeHCUa+cjwhB6IGPhNMDb4WOsn6pFiWqbn3Tt0GREHrFQzqT1jtchd/TOfDO1WgXdnj3oSHQRLAIZ1tTaV4TnSmU8CFOF7VPWptVcdyZq8pgNy9fzkc9RG9b7hbZdX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510081; c=relaxed/simple;
	bh=pAeuv8eOL+5wg9RgGs+Pnrpz+ObPQlxFoMAfwp9+uXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZiqBb/SBBbEhFIJESW1OptHUuup775mJWVHhJnb9/nvrnYSt2jB/8TxDKPKQtMQi8o2OlxvZwNUaW1So+RnB4doLf5ojRzHxkfaNAGCncl4AFZncMtB8Oa7OdhO7fxGuXzgTmEuctabNPIMfWmt9qKVjpZ5l/zIVkiNaiBLIVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq5IuS50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIWz4TAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq5IuS50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIWz4TAw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78rPRA1709806
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 10:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvIAOFltxWle1TwjCIbYDRWklxWqBrXkSsk3joE4gzI=; b=hq5IuS50h/SWhhy5
	stXFwO5kla4H4xLD5en3Z0KYU7FUXfpwrZ5VcS9Oepmh3E0eoMu+INO6pxqUzQEF
	7x3lIh450PIHagJhyvQmvmNJLnSXAD44BXbfjQhbTmxVCv3PZm9KQzsYq9ACQ9g3
	Qm3BebQsop/IP7jRONacxY36359y6Ife0sJ0TyAA9q2rwUdGFsNMj42LW28UOazf
	Txf04PX81BmQ4ioPy8htxvtWtuJ5/ypM68j94XUYf0BOUzuXEN6WRe957wxIFSTJ
	1Y+Kr2NOKLNC+H1juUQo0Xr3Y7+Re7EdR/E+DOrbuVmxFcO1+H9N6ubbcpbFTLx6
	wuVAUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue1ehn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 10:07:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a35e1923so1800191cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 02:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510077; x=1763114877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvIAOFltxWle1TwjCIbYDRWklxWqBrXkSsk3joE4gzI=;
        b=AIWz4TAw6iXadvVCLf9pyRiB7ygdO0u6GfyeToiFeZu9dUYNmhXjEkj4q6XCR+QYrC
         QzMoKq4BJYwwgB6PAMj5LWMb0vEP4RkFzqgycyBmjy0i7QcOSqMXxBPWlytYjc9aQfgW
         w+SG2KeP+uIle5RFJOKXq+1BeO7a5gYULQBCXM2SRkqk8ajL/W7MWb6zQM6z9HOhcTom
         KayrSw0C8b7IE0NV4g31EU4PeYlOLpWodbmzCYIwaHyhLjiH6+YOUlQprBzYAhRlyb0e
         4iKPAUZwSTPKaU5a+yD//9+fdgrhFgLsqi/fezxxP+bXl7OYM4iRahhjvoWI2ba5J4+5
         9/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510077; x=1763114877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvIAOFltxWle1TwjCIbYDRWklxWqBrXkSsk3joE4gzI=;
        b=R/0Cao3wQ5+NSu/RUQzCG++UKKtNlZrgI1a6mlyyGSlNi/Op4paBbx80K3QU3SyqoD
         VLlHWFmXuMkwy7XNo28j0SwrnG/DGxEkCqxZ34S3gX4rXZBDeiaNz/H9cMS4X4BXH6Dl
         kw4FoF6uv9STTU2g7mJdJFCdI0iVJJXrJdkCm2bQ0ultRMIQ+lOe4ijGrShKVe1jaC3B
         LBYdM7DjLcNNyUIWbT9YniEBF+qIy09WEZmJSlsXn2Htm9zO6k8WLKMIITfeH2ZAKLh+
         XV6NoLLIK16DVtMmDEV2vC510lZIkm3EY075iTt9mQX0TIHnhuLDDIOhzF/47nmsBYXE
         jFnA==
X-Forwarded-Encrypted: i=1; AJvYcCWI1gwLh5vRwHC/3fkukcjdoHGomK3iIbjlRcfZysjjGSfSvvQvKDrMna94j3XoYpAWiad5QfiY4UduN3k5STUw@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDzD/HxOpzPFNrEJwc/2+JTLpl6t3vfLET8ivcG6ef1SAW5Kd
	OFBMHp3zyhZqOHuOPHhkKwGvqxhL58u4F0HA6RDUgIp47mfpI8g9+248/nSJ84j9iUtmTiU51z0
	dCrhXXhemIgvvuUuOA4s/GoFkdAo6dIazkHby83tQ0GVAkVmaQR05AVlxU/pugMzaocmaUKag
X-Gm-Gg: ASbGncvWN1Om/aHNhXaCk3e2fKY12b9nktYhIxZodkbpH6wP+tXNv3jPAx0t9CMvvPU
	ch31Plv2cbgRshKlFZgpFxquz+OolMn195nQ3CqKWdDLrHSnk/uBgVr9Dub2QNxPSlFq/QNTJNN
	w9qlp5+1FXOLJ13OrF0EbJhBaMAtxberHJivqcBGwIZcuqIHTCskPiqjpaMKW0gVmU7B6KLORQD
	VhmuaQ9dKnPNhso1DbqM+Lml9ms8T07dhRcUzDZvsaFv94EabH5gvCujmR2NWToSr/leqOU8ea7
	ClNqjN+MSrCb00yAw9V8IAN+8aTwTbC4OiVWP138LRWhpsj7l0jXZIh2czokSentGquyh6cRr1m
	3p83+FDyhC7MxhkAWcEXLhTQpgA8DHQR9N8lLzTQYQlrtJiu8YYjrDt4Q
X-Received: by 2002:ac8:6981:0:b0:4ed:94d5:8d2f with SMTP id d75a77b69052e-4ed94d58d96mr13070831cf.0.1762510077104;
        Fri, 07 Nov 2025 02:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCffUKEFhoQWX42OnPuY8WARk25VbAeAdm+d3idM/CIVmUeG3yhPMYpj8qPKqDcpRK9eDRMw==
X-Received: by 2002:ac8:6981:0:b0:4ed:94d5:8d2f with SMTP id d75a77b69052e-4ed94d58d96mr13070671cf.0.1762510076732;
        Fri, 07 Nov 2025 02:07:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm200008166b.72.2025.11.07.02.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:07:56 -0800 (PST)
Message-ID: <22facc8c-7830-4ebe-aa04-003876f093c9@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-7-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-7-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690dc4fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QTrYF5lwelmmVfwXoV0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Eqjzad6y3rFtZUp-1WIQgYrHabNH2--z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MSBTYWx0ZWRfX3GcNq0WG98d0
 nN+e5jp+DzNWjxS7ulfy+8llngt71TcRaZdMuBQKbDv9Tu+R3/rLKw4qc8MfF7R5etn3N6ozwB0
 1dyifMojwqrRXBRJVvJUWJasY5AfjxJDesk7mpyAyh2drjiU2myn3zGyuCb9csgl+gVOs5K4fcv
 rYjXZJO/diTfjl1kusOrEVXj2l0uRBBchKam1GesDIwoP8SD8GEnvIwy2tzB3rqfsKEftIap538
 R/5nZ9k06dY/eSW3S518CQ2T9CfEUpLsEZYZdwL8LGe33OMcWnvbjjWjctc5BKMAsfaNYQFYAO3
 n9tPQix+npFtN4v1SZ9jpqjZP6xZQ+GnXB+Ay4ruiArZ7goMYMXmQryvxD3/37by8H3a0tpVXaC
 3MBvQ1NEhB1sA15maHnS5m7J050Nkw==
X-Proofpoint-GUID: Eqjzad6y3rFtZUp-1WIQgYrHabNH2--z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070081

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> qcom_mdt_pas_init() was previously used only by the remoteproc driver
> (drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
> transitioned to using PAS context-based qcom_mdt_pas_load() function,
> making qcom_mdt_pas_init() obsolete for external use.
> 
> Removes qcom_mdt_pas_init() from the list of exported symbols and make
> it static to limit its scope to internal use within mdtloader.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
