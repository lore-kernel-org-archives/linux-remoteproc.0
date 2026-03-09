Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF9376BE4
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047534; cv=none; b=j7U/EGORVNrIgCd6yFVTu2au0gsx96VSDFmfHkP04XbR1JBPoVjLFd4/uBDrHNaFGJeTW6WmiUOVYKCnxinrB0W1GvpWCEcSjhGpIBdFySGTrg45ptAxf6+oSLiLUczOjbUxygIqcv2A969+ad/Ny4aIYkK7wAAcMuett9YWdso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047534; c=relaxed/simple;
	bh=Q2J+r2dSfTS2w9RcAxTqCjJw6if9TEPXLD0Hi1LfNcA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpU3BadAXDGyFYB39kl0qWSpxjBi2uvgHkJG0LgH7RXNcss6q1+aTHAUT+3MwCkKAKAgkJUxfJ//EXfOMbM+qJFGHZnzPKBuPmnvZpzho9xmT2Ita8HcHCyRokEU8p/9QcK09qKPwXYcFmH/IAmYcxSKTuGS6UEL/a3M+SU7QD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHru3esd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/+mXK6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHru3esd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/+mXK6b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294NWr51117133
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 09:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbMtvtdOfLDdatvp+5lzCch6
	oMIueR07h2NcUioWpFw=; b=jHru3esdNzuncTNwyW211a+aJdCkYiYxILsoZN+3
	1GwgTcHiMn/ymHOV08WINAfoWlfYw32mmtmF+Seo9nDBKL/8faTBqtOibVjY8T1b
	dgaY0uA7GYpKzy2BlixGrj6mN62goEwdjRuKoxo3BmtDppXIOIRCT3W6eZFhNujG
	NUVHihFT8lC0N4D4b9D4sUu9vqiYV7661k24lzZtWboU4mtxwP07+llelKSKDhOL
	XCCcln8fcMYU0Dbq9i5aXPPkIr1kAbbwT4ojrN+2XxrTTpUirMmL8EjgT/DODPGl
	DyxQTsHS6r2QOpA4ooTD4DOGq2QorD2Gt3YNLkNIxsnfsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvqrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 09:12:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81be6f05so709494085a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047531; x=1773652331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
        b=G/+mXK6b4p/ttPLc96rKIpLQx0rVatRsBeSzjF6/+gelzgZLV8+rTlRRrKkr1lDudb
         x0XHory0GhLkH1EV4a5PpiAhY/TRwdi7lNPcuiJaJ+eroKu8I+pq8tKeZgoO9rnO8mAj
         3GPZSRLFlKEjh4bUiOLnU4Ym4fqojvyKGzTYir5jZPGDnijSdwEZ2I//IX31gXkKEP1s
         foFFG9rGEYwaClVPqGjcfc2PF6ChTLabjzpl33wxEpXkGgIb9BiIr8BItfX961bdKraS
         oWN7XpKgf9b1/RiiDTdP5u2dcwofel7MwuTc+xl6KxLC9uT0LhYultFFB/xZ4sey9DTv
         tyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047531; x=1773652331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
        b=KGmXIVPyPTiZ6Vn+UqeNWbEdNQQ5o9zcZk5++3SxSFUa6aeAH0CLtfZy7SmrvLtxGI
         ClJD8DsR1hRPj8/AGYg0oV/T8ioqZEQXbfq4u+Rr+G2BdUCGeASKkaI4d4UwAUxlW7Sz
         5BWLFpnjez9DK7DeBkJFvQVy8N5t8+lwLQhMX4cBPM0O8RBbVdhcnnNP+LmSY6cblI+n
         pWOQvcEY0zu1VyGp3dz6sHGo5EmRvXDFnXWU/Xvi0S7P3/Cr9nd6NOK58fowzy0M3lnl
         s+jF1rt6JFm4Vv3A96uzOe4fI23xYrTOxDBC3b58q/vgTYeQEV0cIFPC1t3HSl2TuONs
         5FGg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5/FoKpte1w+8OEZfmc59sZdcQjADnsgi1v5d77HvEMJVBbYJytiHbJGyVBqLY5McSeXLw6tp8mGUGTy2Jt6T@vger.kernel.org
X-Gm-Message-State: AOJu0YzGb8PZokOUZOxNyYQk++WaCqXcIcYVLwa2VVSe+g28lW9Pnmcq
	2K8E6WDZAYrijLpTfW2o8iv3qCwhlpwQJr+/mJ5HW+H/eLkBG5jTszd7TXKpk4LCPOWiNfNAV7Z
	kAIN/mTFOs3jcY9LCYeVMQib+55vqc6PqnSkBrHevJvmUIjSM+VD1lUEZWC3OqfrPN9/mL2Bf
X-Gm-Gg: ATEYQzxf8YGqGQOaG24TaYKDql5GGEUXSYQjqFbGNUGxDBxtnXkcpdw3orjQTubIQIC
	6tfHwrw6DkLgZz/TckHO+KS+Prlt+m/it60eInzky29x4QUY1tl55yCgvnvM73+9DpZechvS+/C
	50R3PN7FdpfcrHJzyv+7j10VHAaSvkOa6dWruTOarlg70+tgoJnjzjWbmRykdVaUF/HElwcg4oP
	zSpdQarOU9oqRWi56YUG3xsBxOIg/ELihTBJVUCMuZFdEOqdyHtgOzLWBsbQ+T6h3O3qftK22/F
	inTJSbQLQat64B0nz+fmKfMyujI++Px0kMNA/RldPI37ijtYuig2GOnU0WnjU93ILTI7Um3PmOk
	drIeUvQLEiIs3/T9FX1Vcsdwt+6U65oFXzcQwrzTA3/vKBN/kDxqh6Q==
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cd6d4d541dmr1304568385a.63.1773047530890;
        Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cd6d4d541dmr1304566385a.63.1773047530429;
        Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
Received: from trex (110.red-81-38-138.dynamicip.rima-tde.net. [81.38.138.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae483desm23179497f8f.34.2026.03.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:12:09 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 9 Mar 2026 10:12:06 +0100
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <aa6O5tir4kVIe0eZ@trex>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-12-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NCBTYWx0ZWRfXxdN/UJY8/I8A
 DPMUyiqlcAMRuFMqgkV05cIByXyVs69fpy7MzlYK7sBB1J7vEECM6nkeSC/xB4JoTXLU6GWhxgP
 brPGQXcYCxITZPfgikVeKxEZO5REC1goBO+nSQga3vQ3U2TBApetpkjHJKPhJfthjcN+UmMJ9w1
 w+3tOCOa+d20zinTGwv846s0MM2lO4LcDVsqoWT1ytJadWIyfZ51r52u2qWYtmJGeM//+9CpX9S
 ci1Yob+rtEwDGy7gUT1Xb+tDRCkfirYJwnhfq0+A5LJPEziolMlfZPsW9uLI8Pb+a2nd4KcNEE+
 AejB3UTob7PLcFZicEXF9nebsghOg66cLbey+ijQGBL3sqF5Vo21eimLiNcp4GJSFpDrCJetCXw
 ACfW9+gHNCs669st5sqHswwEikQQtaLh/paLhcTRBE2cP+BQZ0yID51wDwY482we0il3HQkVpbI
 5QT6RpPAJ6Xjb7Hh5Kw==
X-Proofpoint-ORIG-GUID: qVnpXmEM0VfXtIV3virF_BRW5_hM1LBW
X-Proofpoint-GUID: qVnpXmEM0VfXtIV3virF_BRW5_hM1LBW
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae8eeb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=P2IcWdTxk7sEx2G8DnB30w==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zah51VvIpe4vvf6E17kA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090084

On 06/03/26 16:20:24, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c |  9 +++++----
>  drivers/media/platform/qcom/venus/firmware.c     | 11 ++++++-----
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..b3c5281aea91 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  			return ret;
>  		}
>  	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  }
>

are the calls to set_remote_state required?
0 is not the IRIS/VENUS remote processor.

If it is legacy, maybe they can be phased out?


>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
