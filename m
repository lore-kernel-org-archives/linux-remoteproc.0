Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415091E3DFC
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573803; cv=none; b=enGKdXCcUqzcq4eAXzdYY3sSMFHvf3z+Xuq3FbOQETVYfoCLCsku2Ca1FXM3/V3+KQdaGVIbMIyvA+tTqo+9egjMChF+JAXx8jcVmCSTrGC1tZVGc2s6uRTaxTo7CudkaifH2O2uSj0AmSpJ/UHEkyIvm58xFDpcjeBz4iXc/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573803; c=relaxed/simple;
	bh=sX4muvpyzWlipm3+edEVZE9OiBEpH0DByrdbnIKMYr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxZkkHWrpM+i3G1J4MI5YifyUKxDpdxg7h0SbUUxi4+yO9fv3iyZwE8Tjo8dZVjVsJbuUeJ6YjtowNsaiEDju7cv6t1MNJRxg/bRZYTa1yHgx4Ent3xSPQ9yQQcrkFE/GRubyr6KeHjswYvCJBajY3TprcYpyXEiuF2UCany0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtSoBD0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtSoBD0t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATM0V031899
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 16:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KC691n78UfcfnBIMAEEZOgix
	8UerazMGS6DJH8rBSes=; b=jtSoBD0ttl3RR0OcVWAiU/nuCCHpxHsJRs8T718P
	mPp0eDBxxTQce9+Dar557Zlf9gKMXJGcgJSLUZZjaCzrI59/MGrbjO+ecn6sR5P4
	/CkzAuySTJIRr7YNmt92bvIlxVqquRB717Kxu5nbZ+5rvED+3XClwt5jMx6jH5rw
	vDT25pWCuY07CXEUk2jmFMo98CLkWqP99IDOjgamiXKg1GUO8176ikjn/rnPwrOh
	6wSDPq5uxAB3qEhypBM9JT0wsNGqq2upSh2fSZVEsrCyUiqpels8zshaow4M/B9D
	d7/iONRXmp4uXex3oCuC3NI9Vvr6lmCqgGrU9Gu59p1Ghg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kjq93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 16:16:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3b6450ed8so354895485a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 09:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573800; x=1743178600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC691n78UfcfnBIMAEEZOgix8UerazMGS6DJH8rBSes=;
        b=o0YCY/1kJD9VEcn/5H4s/9bJ83TTq/E9cTaJGz+CeoZD9wQO/OER67pRErL2388IlR
         PlsBW6/aIdPiSJbwOnK+jED673NHsbKnnVjQ7Xjc348e1wzXceySpvXPKhRRitnLvgFw
         C+nTJalvhcK7t+1NeIpZhy+paRNRvhw6Yo3SglUlFhy9qSDSuG4JqQTJTEjZVDJfXdeD
         Dozsii9Y9oGfFw04H+WBu6jcoUxMfSKPi3md6V4B1lBKOVbmabJHCwLbFblVhitEu/rv
         QU/A/1UrWaDkeNBOEU01Pwmdy5iuzmjfXOg+s7UVg0F6ugCcW0C6HJ8TCCL8O/fvi7ar
         63SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpHPbNMapxg61O17CJssVqpu350CTkdqfcCavcuG6zn20Vf6HLpmrBLoDWcl9cUUKfwahkqPIdEjIVCumQLnW0@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRFCn1aRNLcW2rIBNHp3rNN5mS+k913TjgOIw5mzEDtmvC7hM
	Ne0jhoYa3yEnFdw0feDh7CHdFvwtxMrTSG74qYV9R6lvfc33q9vPIs6UeBsAakjLz8PUf3JKX03
	S3Cz8+O2gCKEAFQJG+11K4i8w8ZdClKnYEe0e0sr9YZUyjdvpg7CjqLnpYZ/791Y+3D4g
X-Gm-Gg: ASbGncu61C9Xk/4SkTcDRFR6NYkfXvI8+iDqhfGCLNvutQJYmux7j5Cx/3XzhiWaTl/
	IZijaUdkhN1U1ke0xaB36cpPxuj99EQH2Mc0OKf0W01XC5ntzZxgXFMhuj02jEWwTCZgrtXHgFq
	shS/4z6X6qVJJ7ChfyeDwwMF66fi0y7+ly59iOb37GeHy3O5QPjbsEIeOgwkvofXfWBzA05DWdz
	7NerSCdYdvbJyq+GsP43pe6jlt8quLVEgKKjTEABYlso8dH1DMOJtYuLRklojrJITUTeAVmrepo
	OUwwsfmq71CdKclxjkwUceBWrO2lL9cyEmnw+S31OPtfWXqT8acfvUpCPS193kou+hSVFKpEU8p
	8y04=
X-Received: by 2002:a05:620a:394a:b0:7c5:4a6c:eb8d with SMTP id af79cd13be357-7c5ba200eb2mr484938985a.58.1742573799922;
        Fri, 21 Mar 2025 09:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCnw0RuPGGAcRXmxyrZFcq6Uvyn0JUfRhjB0xBqWfhqbZS/bLEaIZ6/ICcRwJQBMDqvBgROA==
X-Received: by 2002:a05:620a:394a:b0:7c5:4a6c:eb8d with SMTP id af79cd13be357-7c5ba200eb2mr484933985a.58.1742573799445;
        Fri, 21 Mar 2025 09:16:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c79dsm212119e87.70.2025.03.21.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:16:38 -0700 (PDT)
Date: Fri, 21 Mar 2025 18:16:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: sysmon: Update qcom_add_sysmon_subdev()
 comment
Message-ID: <ytbcjcbzwftajmovkun3x44tvmfyljthzcsrml3vbwyvkd7glg@enfp7qfhtzkq>
References: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
X-Proofpoint-GUID: II0m11UmsnowyqiMqUc4AmLKfv6qAiI9
X-Proofpoint-ORIG-GUID: II0m11UmsnowyqiMqUc4AmLKfv6qAiI9
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dd90e9 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Oz3NjKvTjiMZACM5Y-cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=717 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210119

On Fri, Mar 21, 2025 at 05:35:44PM +0300, Dan Carpenter wrote:
> The comment says the qcom_add_sysmon_subdev() returns NULL on error but
> it actually returns error pointers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
