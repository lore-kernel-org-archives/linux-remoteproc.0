Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0216FC3
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448244; cv=none; b=uX9PX6l+HOJcTYiwH6Az84dod/LBXoEmzxNt6QpQ80/zsj47TJyb+y9q1dXMmacTvGS5yk4YhHza/fccVpEesFwtUZn3qKiC6Z5RDAIqZpkCEqVLmRS2+vB4Xs+KbYxRMByKG2JPqdXCNx8qzKyc9bOKLSO929dSpl3dA3zPSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448244; c=relaxed/simple;
	bh=KUndq4hJdVEJD5ngNJGBRZeJyb0wTFdvOJGt1kRqK6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9oO0tQ6kSRaKewHN2oJxst/XlZDl174JiSoEYeKw/1k2LkO2XQZPWjg/BQN5HDN+dwWbQYfG9Fzfk2Fh0iPDDUe4dmlwqrJ5f3An+gA+Qb4DiSOdAq8CSxfEpXP3GvFxbVSCeLHT0xWkAtwOzb9tAqIuAQOXmafCI7ia0IB/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnnPOVfG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnnPOVfG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54517Bui026344
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 12:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3G6J7mrlp65EzgO5VLytgkQO3fSgok1k/X2CkcanNg=; b=DnnPOVfGaj3nPpIf
	PitqrK0HiLJjajI2U8/bck6JhKAqtp5hVEi6zBmiOqVy8L+c9coT5HKFHEbHyBH9
	oLkKHiLCOTA9w5UqhXdhAzz+IIX+fv5kCDGEG0DBnGtMWGxsoSluXLc6D+SOBo4O
	ErAl0rpaER1PLt6/cqCb1/8o5JLfX8DLm7Kx2ydLn7yObwuKtJeymMMz/NqoiRzG
	OFMf5RdMKzDf5bxF0fFE25RjIHdwFowwURPH9FxTP4i/5MW40oVsiFoi/Zl6kesc
	NYSzqSh9BCifrPaczyrigO0MpTq6jO8VNcn+o4pmsYUJf82CXER6LVMkkqIZw6EN
	yyQOmA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg434d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 12:30:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-afd3f1adff7so3728096a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 05:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448239; x=1747053039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3G6J7mrlp65EzgO5VLytgkQO3fSgok1k/X2CkcanNg=;
        b=d2JwVXNg1zpF14P/GYULJXudMdmq1zq/8GW33Tc9PRDTG0/+BR/+ZROooxxisiDeyq
         Xao6HtY7jlzhVY0nQ9KISdgfXA1DH98DzIEyuKQB/Gykjezn/Tw7DbHity4HFq6Tu7FA
         dpF9jr85FSY2ymIhMdtvlYgv0AZE27hPfZmIYpZZFyNT1JOu1aIxSp2aPqE05IoO9Dhq
         zh3Jg5tXYhv763/Q6OX6omRcTzgdKTbWgl66FEIwdwnGFmpCOf6gbYALwnZH+WCCt/LV
         6jTsqShAHOSJ/Wn3fbn4IaNvUaxg1xB+dhpnYxbi9Y34J0aMPOhN+XowWiGZKQ6cr3GD
         VLEg==
X-Forwarded-Encrypted: i=1; AJvYcCXy+C8VHd86ssyPtyQSVcUt4y468/V9OaOBxKqg1/3e71eTUyEVAcEg3Fp5gj3i/N2/3lA4voiXx/0IqSPWg6gl@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkdZYfzCOyoRhD6i4ZJsusCYVBZucSglr1aD8fvp6+w+LjRNS
	g4u7/c5jkh0IjLzcO25mvvD5qXCynRcCmY1JMnNr6Ce5uvSc/ao6gNuMnPcvB1MNjE3PBMtP/PA
	qGwZQ7VpX6TWKVbz+rVwXLJUcI81F701SnMtRjIbU19j9lW31yKac3BzsnwPEJS27dDvz
X-Gm-Gg: ASbGncuZrO+GcaRggQVmAVNqs6mf4zdNOJ772bPXNLF0Usx5lg86wnj6HLNKUD8tWzu
	jqsElNcCphQU8BM9HieQiSrv/juGDU2uXc6UOYJ4VkV3Ajlfdf2hPykkyI88UVt9J7Jua4hhqTZ
	AG47da6p3wMaE7jM/J7CRADzQceSZgupOd5L4VE5UjK86TymJXNWgjczlk7B/84MBcZchkNmJtn
	df2fg6HiNKWuH0n832+CmK4kDp0qUCFv3+FfoYvhaWdhSH98g0gqLulG/BgPlfIGCPqR7DzIHpS
	0Wtm+WwlXroDbWKOI0TqZWiZzRmHuPMyWRIgCUd3
X-Received: by 2002:a17:90b:35c2:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30a42e4ec2bmr24078905a91.2.1746448238747;
        Mon, 05 May 2025 05:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiYHZNbAPD2hX6uotPQt4rYNK5LSmkNVeXzY+HRrfyvbKuerZll0vE/BGL+crksM4WYtDukQ==
X-Received: by 2002:a17:90b:35c2:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30a42e4ec2bmr24078856a91.2.1746448238319;
        Mon, 05 May 2025 05:30:38 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471f005sm11506606a91.5.2025.05.05.05.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:30:38 -0700 (PDT)
Message-ID: <538b32d1-c7b7-41b5-aa93-d285604d1f05@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:00:32 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
 <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sCdX17lO7BEEN6j7NDI8jJhoYODmUUno
X-Proofpoint-ORIG-GUID: sCdX17lO7BEEN6j7NDI8jJhoYODmUUno
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818af70 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=iPeUMZ46Q7pfEY4_gPoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExOSBTYWx0ZWRfX+4etCcq5vYhi
 3y8dghS2P2PCOP1BNCPpS6c7q/x8Set5fKaXFaUDb3KvHvD10P+3zl8WnM3XhT5rBCVkf4GVAA0
 HsQk1FcZDir4tS+7dA1sfVGmlX1hjjN3zR4Ka3lUyaiQ+4TUmbphWLqbTkmOQCK0mL1A4XMRsDF
 piyzXdQ4hhd7GBV3Z3ICJA9Gp3injKFbumZTbdMSWz7KH7uzq26db8l1XxxqWWprsGFuSOZFWoL
 NCV28fK/oVG0mRApsaahsCkBkHTcPqdAPvWCD+sKVbtlXpAsMhHB78cQ2qmSYDBZVQKfs+6fGc/
 Opap1SjeRBDH4fg9y5Ad7/G6kq6IMiUnwne8xqW5UcDrzavhE8mzH1dXeH5AUBDDNiwQz6zTYZk
 FPDkhu8V8IRhW46SWo/ZD/D39L7o6dYGcj304cH4JzvxYM9yTbdX63HFhh+BRQYEHnDVOOS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=711 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050119


On 4/25/2025 5:17 PM, Konrad Dybcio wrote:
> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>
>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>> SoCs support secure Peripheral Image Loading (PIL).
>>
>> Secure PIL image is signed firmware image which only trusted software such
>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>> load the PIL images. This change also introduces secure firmware
>> authentication using Trusted Management Engine-Lite (TME-L) which is
>> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
>> TME-L for image authentication if supported, else it will fallback to use
>> SCM call based PAS request to TZ.
>>
>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>> came up with this new PAS based IPQ WCSS driver.
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
> [...]
>
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
> You abort probe if wcss->mbox_chan returns an errno, please rework
> this to use if (use_tmelcom) or something

Hi Konrad,

do you mean to use 'use_tmelcom' variable from driver descriptor? If
yes, what if mbox_request_channel( ) failed?

or based on wcss->mbox_chan, should I set 'use_tmeeiihcckgddglcom' to
true or false and use it?


> [...]
>
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +
>> +	if (!segment->io_ptr)
>> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
>> +
>> +	if (!segment->io_ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (offset + size <= segment->size) {
> I believe this allows an off-by-one (remove '=')
ok, will check and update.
> [...]
>
>> +		memcpy(dest, segment->io_ptr + offset, size);
>> +	} else {
>> +		iounmap(segment->io_ptr);
>> +		segment->io_ptr = NULL;
>> +	}
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index;
>> +	int ret;
>> +
>> +	/*
>> +	 * Parse thcitejlvhvdriihtheuvhn

>> hrough additional reserved memory regions for the rproc
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	for (index = 0; index < num_segs; index++) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
> https://lore.kernel.org/linux-arm-msm/20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org/

ok, will implement of_reserved_mem_region_to_resource() and
of_reserved_mem_region_count().

>
> [...]
>
>> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +	.tmelcom = true,
> "bool tmelcom" is very non-descriptive.. call it something like
> use_tmelcom, or maybe flip the condition and call it e.g.
> tz_managed

oeiihcckgddgcjnfeeuhjfdfbcfcdenvfnjnuceuntbir

eiihcckgddgcgltegldivttfeldnhugbnjvtllkkrujt

eiihcckgddgchbegrjtgfnk, will call it 'use_tmelcom'.

