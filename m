Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865341B355
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136637; cv=none; b=Uy3ty8DIiDlJvo03FY1STI8kZI7RULwIf1S+ol7DHAq6QxdOB2pllI8qJRNFHbOo9KRzCFTpBs0xVATs9IMEvED6rsDE4GYO6JBa2YBU2qg8XQfr07fqGcARpH9JbdZOvdbKLXRwRLLxr5c5+rgbOqXdvE7965TrWdIC4WvGvA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136637; c=relaxed/simple;
	bh=CbrtszZqY4+hGNS2oDyG5DABGwPuACbTE4Q/fV3gqfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dry0AYRHlLflOBeSX1fK8bZuLaQywI9GcKUuq4XuJhHxIzQSrHcWmhKWWKeWZ2X9rAoiPYEUaHpvbyBkF99x2c5ZUgQ1+YU8xCz53rgDnykyunt8BYavSMSJg5LaEL+pVNmt1na8NQXAYEFvFgpPoCMBHmbbPHvtCRpFMi0RtDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM29PPBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArEKpWJy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM29PPBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArEKpWJy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9A3q03087351
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=bM29PPBAOfK0D3uO
	ml3hIfgefl30u0LjMXnpy4nUYL85G/cEds2e5/kBbiqC9ctGt0Rg9xewFlv+bowf
	xpYjgzSj4Dy9TPBlCmBXYexZkzHfOvRwjBz2rV8i+Mt4PStfAt7DZC/nAmt9Nw15
	/IGuGCecOGf3hN8IV17tfwr8mgJTSUIyftSW31id2pZu+r6nMd6ce/24ppxrZZqs
	r5rxs9J+VWOU3l0Jo8Yb7aWIKqF9nwiw5pdXy6MM24RTUDYRr+jGa2UskUuovWFO
	AA0dky8LS14sXa2uBNrJhVIdFUgWK3jNdtKlMooKWWw3+2tx11hsreyrcc0kXql3
	/YvAFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy83uw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:57:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899f6011df3so54449096d6.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136634; x=1773741434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=ArEKpWJyFDPARN2QSllZaqbY9HWAmwd/3Cg3SnODpsC72CEut8/KCY73tsNcL+csxu
         kDsjVGVXEMGWs2GqAHPmtLwiMdcy9bRCfw+SG7OLJT9/GPYyjNdot9WtqOL1RfhvV7SD
         WYoxZw91Lg68k6XRWkriBQYdVKwOz9FnSeBP0EHq/46dZDEpS4EGJrAhm1ZYEpPR62w7
         kXd086gX+qftHKlI8zZB9w43vZlQLTbcGQK8jAD7ENr+Tf9ZgE3oU8FW6kFfcxljubcr
         Z3Ua7ttZH78jZlZ+KC/OtTL/TcLUPx3YzFasX8sqhBFhsNDMjQ6LgA8iNTc1iTx+q9qy
         FTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136634; x=1773741434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=THgBA/hYId3+GEILdrzuUMQhrWiaFS1weNBqNB2x2EnXKJeRfp+YSSvYYRpQf8HV82
         115YAWKJlt8Nq5gowcft5fjr2qYSwM3Po04xjgah4zG6BMwOinD4rqDWHXxGQUO/1Bao
         eaST84MFXnz7Vfav9Zz+wZClNSzV8OTyXR4O4VdJbd0a3D92NmeOzHp7d4fB6wCOCuI4
         tWcgdK4YxY85pSb9nn32hl7a6A9ktSIJ0WSpGRz7Pn/9fau4giDpZro+RF9TFx2VoHWa
         775i/JKJzA3mgx2o3URZ4WpF7rFkHUcqG6Kgyf4e+BEX4658uOuft0EzMs1b7MtDOIDi
         v8/w==
X-Forwarded-Encrypted: i=1; AJvYcCVZeBa//2IbCDfMmLMaJtL/saF7JO+bK3fmdwz8Ukg+ESJlDKDS6CdmvTDXxL9RlBFjetTKtGUQvIo5GjU17UCP@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ1AZivdxi0hrbFb2gW2xFhfZ/+okSWNupc1/dDCHQV9Vlxfr7
	d/9aVNHFJhB0boikuTT09TVBOQBwsz13KZ6fzdKpFPB59vTJtgAlRaYBI76tJlEQfo8Brvl34rA
	qjjQ56Q2jJ5+nt0KywOMwqD929HJFlDd5PCbArsMqrPvbozuOkmRvAdRsMdPGmyoBgTbvSbp7
X-Gm-Gg: ATEYQzzy3tqa4Swz3ajLurdGWhCDv/0Etg0wjjLCJrC2Z53DoBwu5XlRscTEzeL/eW7
	3+HvEKluKFQ6WY4mFVxjeyEM2XwfrumGpYXOokEOH+RnTWj91nqpSh+A8zDp6y8WcjAyarr390G
	tKKKxSs+5dpZWeVhKzaNVCCPqhS8Bwes2FBAU0R4zTwM82K4kT55YWDTJdgTfgRPdmlqT8wPUFP
	Gi4sk1fPE2NVEdj3fVT+AanB+R0mg+TU8kgEak2wbsqoyi74ZLH3/s6HtJCh75e6dth1EIdfVeB
	XCFkHi4K8fwYDGP+tIy0/Xub+L2ZkyR3hCiImevNQIi9peHBZ0Kfry0Be4Wm6YbEKRsAQHjVzyr
	WvPDtPmJiXpxd2CyEPXtq4dxjfsB7PDxT5+RfgDBxWYDk6K+rsl9RKFXA38vM4Vu+0EmGNEKT3y
	sfH+g=
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82170156d6.6.1773136633820;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82169946d6.6.1773136633432;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm447860466b.9.2026.03.10.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:57:11 -0700 (PDT)
Message-ID: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:57:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afeafa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Lti85_ANQs6YWTYAGLkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: BYtSHCzmR-cUWhJWnuFSHgW_LDP95DNl
X-Proofpoint-ORIG-GUID: BYtSHCzmR-cUWhJWnuFSHgW_LDP95DNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NCBTYWx0ZWRfX+mfy683KzKVg
 QNfFjKGzXFF1cHx6myKGmvpBV85SWs7sgGkDlUPtDlKF0SCfiEOlJnzEYQYaa6RbuCqXk+XsrZG
 TiJN0Mkau7PNWHokERn8leCoSDLb9WkYJOsRnWpvn6j9GXOxiNvzDgqz3wAxG2+Sj3K4Q3/YaRB
 qqmfrXNFoXVCMni1DE1p/NHShjxIy59S+f7d79oFFoPxH9u+AsZHdL3mXCZXEFJsAOn9gdsJnKl
 NuovdK9QK/tSirWsFWzQKHFRvsfquWvVQFhyABFipl7V961kzM+PvYPXwkFRAWtSuVRhBiMs423
 e/rPJJdt0d2/w+A7YVlBnx5DWojyAJ9CvBHNh9jImGkr5DqehVLcPqmq5sEBbrcgyvf7HX4/SCI
 DeG9pMDBrEId6ITf/JRdm2CblO5H/TIOszGhyUq1DBS9UiB9tZa1u7PMOqPLhMdLqE8R30ToVom
 U1yecq6548zj5z0c7rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100084

On 3/10/26 12:03 AM, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the
> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index 291cdc7ef49c..b8d07f2c07e7 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>  #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>  #define QMI_ERR_NOT_SUPPORTED_V01		94
>  
> +/*
> + * Enumerate the IDs of the QMI services

In case that's useful:

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Konrad
