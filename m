Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854858;
	b=Fxttg0BfJcNptsA8REk8OK6lQTECdfo4Sr/GcfTGwg/1du2s+076eG9iMa5pCIuHpdgZ
	 JWMp5w4XD7Mwvd1aBsU+CAIR+oXxrAqUcqi6bPwKqGkwpQ6fAxktxe8kKN2LKj0hVgX9c
	 H+8jfs05998wqF+Soh8m/5k69kv0+GUIAC/oD4DnRDrS9RLeQOUsC6uQCtJc1Ppm7r/Gz
	 omqRHxgaiqfIA2ag1M416Hm3fB0uq3XWuS6vQJ/2IKeXMCtL9Z01SyfYNPa3AzkL6sOfm
	 +x4AQESAHArB3V+HqswIFJPrtJJQasrFBbfmEYcV0FaWk7uI7NdyIMJIr41lHTJ1Jtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
	b=NW7oU5pb18Q/HQ3yYu1DT0f8oy7ofXWH349VT8YjHvRsL3JR6P4KQwaB60agvih/dxkA
	 YW9PgdSHGyKBs1kYXTX66IlvPKLUTQRVJmoDP/EDGgbv7Nvutbio2bQNvuLtGIaamw/Av
	 3+8fbrjnmv9PoHHcxlBliYiQNMI54r/z2We4we7VIZyfb4u/hfNgXEHDhrhdIDLIFRRpz
	 aKHHGYFUXvmmFuDJ6Oml5WiyQmF3zvMqbVqN3+/6g2Qy9vGgUWNpWc/9OvqwbQMLybOnW
	 3L6A9cfolkuRZj/ShwM/kIWsmnc+o1xfcnbMP5w4r2Vbfhc+MRg0T1c0mHOL6cbBSTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01518606A329
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01518606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIZnx2791035
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wJnv0bUBCxxkF+5/me8K4UOG
	EYnfBL17cIYCxZ8KEYI=; b=QxEl4S5OwYMBpJm14GkNo3mBViG3j7eEQ/LGc+WE
	ytCLEnQDJL4woYbp6IQMvawY0wRDPCaG8f1OwZwJCTOe0/RhhFzYcF/cozvxBk5O
	X/mr2nuazmHjLDSofV1kyyz+sPD3UQQAbhcRjo3ecxCf5eMi8+9VZ2FCQZC9sj6E
	DHt7v5sa+p9xm85raphrjgxy+XPWab7ZL6IUkYq9IZ6lBWWoUycI1ZVtbXqEICsm
	8lEBbum1Pax0R0OZUDqX4oCepPmiqvrjpmuakI4gPbC8wN9LdIlAjn6zOz3b0cd2
	4pWbKf5SCmIReL6zYQI/MdCRQ2u/WxN8FSEn6dtrOV4J3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfhtvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:47:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso112012eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854856; x=1795459656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=NgfD96A7ObdMBQKuZrOuw3vLEcq52bi/tzatQAI/9IFNeipRgePfCpEEn3U40xgi7B
         2hfaZnbpsnnYl2vKEC7FCpdoQgGrUVnshKmUNwJkNQaCXN7294YsUzMk56ceVUE2+bm3
         S/QJcCiXUNJ/bw9wF1+JfxBGhLCbtCyOfg7nr+TkR15qOzUZ/5crBf/eWto3YBkqUGzc
         f6pjsRMB+8Sj0KYpDb1YOY/D3TM3WNNZfa60GbMAMI4Vl0QQjSFRGUA8g7RdviwUNp0R
         7G5ty+M5/9X1cPEBCf9BR792I1oYhp2IvaWqnam+PlFDxesJPPaP0YCGwRmwQzUfUv1e
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854856; x=1795459656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=ONbhPtgaVa9GCbtcKDiTQ+qkdIFBKKneg/DsaMQhOHNjUhefpjx/OHMdim8xz+0bwo
         ATRJFXVFygQro3Bvdoki7+V+1HBr/iFD5HZPy5GQP4zPyKN9LYDy22BYgCAX7pAUzAUd
         TqeDRCUSpZLWVyfjc37+owniMlvCigFnWwtGxAiKY7Pwfc8qKcXePNB4oVL4gpsRjn7l
         3kwGmvG02HIq5JiPIrpfca3mU+W9rbGmCQiPvilthDL5dlfI6Ck9VmlINsfyspz1/zSX
         cPc4IOGuH3ks+A79LfLPwfhvtzVReI9aDme27goTnYZ3jDc9lGzTcXgGDVaer1yvE3kn
         mHaQ==
X-Forwarded-Encrypted: i=1; AL+hErGaMeDTVyCvIF5VxGzPqWrkMexdeUcF7tq5YH8c4ONe7yid1xXFPTJWHhgRV/ueMaoH2uLw8gJovw1sa4N4572S@vger.kernel.org
X-Gm-Message-State: APuU4Z+T1hqvhR9VsSoYJV39Cj95YFdK5aX5h1+CpIemZjEPlaRJbmdJ
	ehHR4V/5voq22WLzGzurvGonJEdVb1c0R3QczIi/BPrQE3jt5CT1TnYwAruD+RM/o4jfQqfz7xG
	Cl+EZT7aosZwYyBEa7i09g0JWZmdMd/0RELFinppIkPqorA5myxgbWiK4AJ8Dias8D7sE6vLJWp
	47TgiS
X-Gm-Gg: AZFdTZdUQc2YOKVFBfXQOJ4QUz+dwDuhSkwYReGaN57HOszRH38Lzgefe7cc3SgrNlW
	l0VqzxOXx0rmThmxvVPD4wSa903vEQFWifnynHeGq9j4T2thw6vtn6tuKJsI53LuEbAyO8aZoTw
	xDC+A8XPf1hr3inPtRSFrJXZ3mqN+DFqqMTUPDLmbDpBRxyQldV0WYakyFwQUrJVl6rFa4AbMFi
	yaQ6QEl3hw+kEwcxcYU4PDo1kce67/oXugUKC+uOsV1o7EXXBA2hVmbnTE0wCTw3MN4FF2CNXm4
	qQYhenCFA6HZPTUhzGbRNxmTm2s70u5YSopliPnow5hprrjwsPpbh7nf8YqpgEIbJWk1qswHnRG
	JDCaxkT701bMR/94KcHGd3gU60Z9asFtviEUi/wx9X7iF7115xCyfCkjxdRrXApcW+5rto9trIn
	Lt
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291427eec.26.1794854855564;
        Mon, 16 Nov 2026 10:47:35 -0800 (PST)
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291406eec.26.1794854854961;
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm34761572eec.22.2026.11.16.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Date: Tue, 17 Nov 2026 00:17:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Message-ID: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb4fc8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HDZkkxcUch80iLduT3YA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfXw7K3alJrIN2b
 z2cETdbqCL7XSj4N3F2dywptHLQUrv4IR+jg7s66vvmILIQONQpz/sy9JpIUMCd9F3h6Y7s96t4
 R1PvRAxijKpJjYnXcbamDJlm5vLniWI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX1eUS7UT62QWn
 +qfIN+fizt2qJ9DcAyDiIzlY5l/5y8deH0CXr1Rg8ZfHmNR5fGaPb/0WU6nEU01k0wdExMvvWgv
 rB7fibarh8b9CYtXSw1pi4XDi1wZA+WUsVCZBNzqSLhL3FgURveHfDPa+SukFfODTPI5AmvCYUd
 cyciP3A2rP0POGUJDzKSe47OlsgYXS8ichdgMLLUoTg/YcDhxCrvsaIwU3ZsH02cUj8sWqzdrK6
 P4y2VxI35M8HgL1Jl/E7QhM76DBOOyO/NQub0fQArHDWh1lAXvupcEKnp3W5s8v50SCUVx1uXLg
 f7LuJSrkLDCF5RRQQLQYkFALzgHJulQajvG174ogVaMTDuShxZSW4fzXM1Mt8kvK1yr4lrr7fod
 R2tXmibVPhlwBZM2a0YrVkzexK0WOTyXjaMtfnqxVoTYHnx+kPJh4QbCSKfbwb5VqSNS5M3TETf
 krcNqQFDBw+I2HepKPA==
X-Proofpoint-ORIG-GUID: SFAG6UJHI_vDWicSjRLqxAB0H3xZnbdb
X-Proofpoint-GUID: SFAG6UJHI_vDWicSjRLqxAB0H3xZnbdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160074

On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
> each with its own firmware, DTB, and dedicated PAS ID. Add support for
> the OOBMSS PAS loader on Glymur platforms.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 374cafd04b62..ecefc6a72fd2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>  	.needs_tzmem = true,
>  };
>  
> +static const struct qcom_pas_data glymur_oobmss_resource = {
> +	.crash_reason_smem = 669,
> +	.firmware_name = "oobmss_tee.mbn",
> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
> +	.secondary_firmware_name = "oobmss_ns.mbn",
> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
> +	.pas_id = 0x42,
> +	.dtb_pas_id = 0x43,
> +	.secondary_pas_id = 0x44,
> +	.secondary_dtb_pas_id = 0x45,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "oobmss",
> +	.sysmon_name = "oobmss",
> +	.ssctl_id = 0x21,
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +	.decrypt_shutdown = true,
> +};

You can move this alphatically before glymur soccp .

With that change

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
