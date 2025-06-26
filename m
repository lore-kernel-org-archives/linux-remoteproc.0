Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D7C2264D3
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965635; cv=none; b=c90He+KlLH2mpN5hngwfGZW65/9NIlVuD940KAWFJ/+VrXbOtdr/mqdBCmDGHawLLji5IEmNWKp24tG/d/G0KT/wAIkOETp+70Xe+c75r9c7XYCFdL0Pd65zpD/dQ6wQn42cU4vhOAdXEzEQMQHEddRLdVqSqinAA5SIKke+Oic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965635; c=relaxed/simple;
	bh=5r6q7+0wAzu943Z2jyQlPtPeKr7oOGYM95kHKprWAYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsvrUTP6fL9bNsrSU5Gek2ApdzrItw5PjAV7fyPhFcqRjQJsKQkgfRYMrlbMlVI9J3D8ZTivquPuWUSyPk4/nZ0ZkgwYM1BBkth4dIz+PqYeWgxIkce4+dsxfN8reCC745h3BZbLjCnQ/Q0M8+HuYf2ZPfpCefteWrcGQLnR1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRwBVy/B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRwBVy/B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ3GQg015400
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 19:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=; b=WRwBVy/BtSis8QCO
	+/YTVUH4/AFeUJ6+bhVkZHelz1uZGyqE4xdOZPVNtH8jZmnVxa5jGJcxnCWamE+7
	HBd++lNOOkubJ+YLzLbZcMWIdzkPpq7QPqFRvvPJVwh6BYgZrNuM2xle0Z8tun1C
	yvsn+g5n3fjdpFdpQPTHsxFXBNTsVLhq08jQCrcsrpUjc8vFIWlDVP2arWcJZpBK
	pptfx20PTEbhP45gUMvi6QsCL+wT7YrhHLesFWt3+MJpaGZIb54m1Qe4WmD05oRS
	doqv2ikFoLKbJMvDoRnPaxogFK3s/yDNGGZPAZ3ZcdSOMdOtOv/mivXnwLy4Fb6v
	11zcVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fe5rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 19:20:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f5995650so685381cf.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 12:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965632; x=1751570432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=;
        b=FPdmbYYqhWqEjSF7b3xl/sZJ0PQvQg2GieZniYjzZsNTnrZvx9LbVoH9eVDgWB5cxf
         o3Gmr9eJv7OxIqR7bisQRzNPdttn89epP2Z5490MblriXDbFXatqiloENm3tm7PGV56f
         BTTDr9zm9sGf3w1e5lovbVD/dAJ8dt4I72pbbTToU/MS/RwiDBinHqVCc9jwXtMtlTCg
         zE22Toh2PWG0F86IwzpjuLGurCFEANmSIc6btXSPBxk6/h7W3QaM/t+2AwfcqFoG8Aus
         UbLzpf7JQ72tHeK8MusCvKB2O08OasLiQJUhH3q6dwylXmVIKnWlrEuX+KN9j4Uw4R5w
         dzXw==
X-Forwarded-Encrypted: i=1; AJvYcCVNm29wZj4uYDi/ERu76svQZp940Ru7ptma51YK+YZJ05WfIkqg3thhmay7RBKpD7uMftNaEKiXh/+tZsFOwzvV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAUpC26MD+2hDHSKOc6aXkVGSg/jvLvA78nbjV11ehXRayW56U
	CIj81Mrz555Nrsey0krCi3oBo2lxppbM8tl9xi9nSJxEUhGf8QqRVzpyZtEnGa7IUhQhiKv4uSD
	mrkguidek4CdbuXmcUDShl7PKFTKwiTUdNxLuVoukb6SNrwthYa7n5tVA5zcg5q+ZS+TCaG7b
X-Gm-Gg: ASbGncur9bwMljmjVBC7qdvh3ZT8xRFZJVnusZZpidbz8PRRkftPHQxclxw2BntSDw9
	r9w9MYpGPOP83jjGSy34DHxgj9D5meLp4EIZNX/wYe03I7SdDSYTu9TtWMu8iRKNumSljsQxbuU
	JCyMWd3916GhUmDiyDd1FN4D4sBS1fXewuPsqXlPfWvo1sw1++axA0f1b8mScN3636UK2mZGaZG
	IikHNPdRQcM4/7zrLOOdR21OnuhFWTZ/lewKvMrvEXOgF7iGqJgkFEWp41SjCAlq+h71t8r8qZV
	Ih+gPLj5fIceQndr/HskYgzbgWhLi4o9Ngtm87XlFCzQlJj44705BJxeE/eBr/Mef2n335L9w8g
	Pdig=
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100701cf.9.1750965631714;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpEZc+VDoThophGjf8eCV3b76cou4xRyhNwgBBJqRGzQLg/M6WUxJq4j+uB+jHeRoCTB1C6Q==
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100491cf.9.1750965631159;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2140d91aasm44338966b.64.2025.06.26.12.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:20:30 -0700 (PDT)
Message-ID: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2NCBTYWx0ZWRfX2yVSmew3qSc1
 zWV6Q/LvqPUCVDl+1BHe5Aha9m58M6peZoh8KBjPomtAnUf8NKThoPxv/06U1CbGqoYO0ylbIJz
 TslmoRZ+W8ZxnMeCC+xKiInLEt/Jfy+SK1BSSNrZD3b+5E72yirJWzX5ViE9Ukk5uAAnfM3+lT3
 4KG2FOXsdHpN5aJd7yJq6VdJ/3K8TJ1a+z3wqUMVRTe2PO2ZlyD2bFXx/QqjsmDTJgeurGm22TD
 QS37Q5zGGUD5UoBEoS6+EnILAWXjCJtlXla4lWfh5LBaAt1INJl0I5aMqXBaIx1UVBqJMLubjjI
 Tita9XXVQhGBi2LNgEZq4Qwi1lKGKRRquFQ9cy41tFQvLx4CDUCVaO03kNUUtqGBwCj/QNHDw95
 EcEI9Impm3Vr3HGKZY4VrR+VAi9e7coVPKpHBBukA/aDHKx3AyE5W8cVcC9TY60AC4u4TAfQ
X-Proofpoint-ORIG-GUID: uRe_pEgoBUe8p0udIYf0NoDOA0sZPGJn
X-Proofpoint-GUID: uRe_pEgoBUe8p0udIYf0NoDOA0sZPGJn
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d9d80 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=qm_u-Z9MdHEKZBNG23gA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260164

On 6/25/25 11:15 AM, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
>  	.ssctl_id = 0x22,
>  };
>  
> +static const struct adsp_data sm7635_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mdt",

I wonder why we're not putting MBNs in here..

Konrad
