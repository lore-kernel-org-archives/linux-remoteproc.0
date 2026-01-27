Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C9349B11
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518543; cv=none; b=m/XetYGCrqd9mwkoJNqETXSAhsgo5FgMZpN8LltiC1+JHYGoewONrtmLenFUKeMy0FEzSa70N/Vcn0Lab6sv52MTirNi0b4Pwxz1X6LpXptHGZlt/H+fLxHtGSueZWP1NxEKfRY57SYqL+9XAYSxT8OzG0koPZLlzoW0gFhvqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518543; c=relaxed/simple;
	bh=I5ppPJvQhXKowx/6MCJntPEB4AufpJXLqgP7Xp72MFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDcUr717XD2J/Xm88FkeQlX6J/1XJEsUiDkfX8UMgmZMAQG/xrsBzQYD3hMNA26kOdMjnjxlogD50iXjO3Ocn5KQoT7pdclFki2hCHYGWW4fsnAHmp6XvwaQKQ06CysRixEdlfsAvwTzrX6gtagiN7HU3NPiFYFUdXC3de7KrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqi9W2iE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSIqxOpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqi9W2iE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSIqxOpr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7QFUW658370
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 12:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4XNJjHe9ozloPS1Ypr9L8/ELG3Y15mTNMRzbVUmNaw0=; b=aqi9W2iE5VvEgBIK
	VJKrp0Ad2F+q/XuQ1uW68ljCMAMolw1TMFq97UEAYMC+vxZyN4mHzUEW9z8y3pWY
	G3Nkg+Voof+5rNFReLSZhGu94vt51tACkz5qIwMH8sWrB1OXN8mGg0X1q+SgBgHk
	v18XVDUssxO2apPoZsu+FuTBxljVSmlnx2llFSWcZ//WEKkVwlsvUnGwR70s8mNL
	g9BBh5fFuhP3brGcFkJL0HMKFg8AbgXTmVu/v+qnaQTM26j2AwDYG6tuCKAFPN6S
	l2RVd6AyJfRaPXOMA+l9ggu/LyVA6W2OwXca54lXdwP3t8FKAaT34MWjGTjYg88g
	KRXddg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn93r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 12:55:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b48c08deso171334185a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 04:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769518540; x=1770123340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XNJjHe9ozloPS1Ypr9L8/ELG3Y15mTNMRzbVUmNaw0=;
        b=dSIqxOprrNoIZvYB7Fwftz86QmSTcO5onyUixWRUDgFreK5dgBIy7qfeXVipWMCwbB
         sT8t0zyzPkzq3ctvgXhDsQ1JQzxRveJwjjyRlDuKDulOdVW3aK86TBRTK8rBn7pYznDY
         hEr4GGIPbdXWfrkw0b9VXnIdwc7y44qh2N5GdqYPkfsns/29xQeU4sElKnzTWHgN1e38
         nwpqsn2zsd2U1//HN7b2SYO2/GvCZPP+E5mLBPNF2rI7Bm/jameau3Y05/AIqWMYYinr
         oFzvXa217uozqrtSM/mYsUNI+QtquFDAJ0uEykh0kU0loxOHHY9eN1jsYvS8HBWv1+jy
         +eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518540; x=1770123340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XNJjHe9ozloPS1Ypr9L8/ELG3Y15mTNMRzbVUmNaw0=;
        b=Nh+fIa7kDgRqwgJloit5EJ/zE3P0m5TTSzbjsdh12d593/P64oCvl2ZqQ+idUGEML5
         cmAtgWDye10QDRe8rUCym4OXISSL2i7Ccf/h1YNmnTlExF3xcfbb5hWEkyxE5upomrxb
         eOvmwxXFFCQ0YAQQL5FxJUXMUU483NXEevKaype5ECut70fs9PTVSV+AcU+rnvIZ7Peq
         OdmCEJ1pOq/xagWvZpmkcx+J80pKnzByKhehVTV71UdOnxe7l9D1ZUMvLSDFIaF5Hqpw
         i5BfoGMLYgH1QHfsAVb+/c8McP5VpKGDetuCK3GQRjh+C1kDHB1tLohOjM0lbSGM1Rmh
         +O4w==
X-Forwarded-Encrypted: i=1; AJvYcCVxfwi8vGev/MKXk7CKy4nph98PvdBMsvIeW3ffHWU5a+d6W0rFaqEyvqvLAUG87a5aHyd12OZ196ay57EeBBAy@vger.kernel.org
X-Gm-Message-State: AOJu0YySIeNIvja5JcxA6XEB5fsY+kkD4+k07l6Diuju4ty5gTbCWzDn
	lYZrL27e7HOYgFQfkzgztmnEEQtiFMxWeGzUCAvt06a9BATx+/A0uQODk1cpuztkPmd8oeaWH65
	Y7j4eRKFPKIOUFEf1E7QGSqqf5pWYoRwdqkryYahz1OvORsPEKzFhrDaP7zAkmLFF15H+mCTV
X-Gm-Gg: AZuq6aKyO4anWUD7fUhvLDpq9jRxiwOQpf9KkuOYmcqHE6ggYc/nw3nCST93kQw3v+2
	o+8z7BmvtpAxn8U43Oat645iQZ/gFNhKQ6+KQVyQhZCy0605cvtgM74Gg2VTtmcvprzYvWel0H6
	GN8gznvrdC3HspoeedSty2ubW4aF41ZJtciWAAeHaX0c9xgO0rqvFHd8SnyYhvVLQOdeJtk8aua
	FfpNGjhQDy2Nmtywpw4PsnFMK6qO3Z3wfRgaZ3Tns/hr8sSRgsXG8gtUeMFIc9yUPeMbhwAVMK7
	Fl60VNFDS5iMM5ZOPpk/R33DUx1jwGI0WXlwQYrog/eZXGuWNbyYu9TONbTGhQ41VacwmSeR9X0
	JXIvS9543A08aRY+Wa/zuYlB9mp3Dun1lTBmm3hF4lEBV7T+SgsmoRVPBgSr+fTYJ07o=
X-Received: by 2002:a05:620a:2802:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c70b73f90cmr147768985a.0.1769518540454;
        Tue, 27 Jan 2026 04:55:40 -0800 (PST)
X-Received: by 2002:a05:620a:2802:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c70b73f90cmr147766685a.0.1769518539990;
        Tue, 27 Jan 2026 04:55:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b417339sm803576966b.22.2026.01.27.04.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:55:29 -0800 (PST)
Message-ID: <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 13:55:25 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Hj5SCD4BQYRFH_XP16XW3wZuEe1IVXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfX37E9d5XnYJpg
 fRJ7kwmdiKBOHmYZfIdzx3jjZwc8FePqGugCPnSdJrynZjYehJcoLMdDUPMjjHn88+CNj0qmAJX
 N/2XINH/8oPZrZHZUNMuw11gsG3FDIXdUXIenDpFXRvoRoLdo0EyprHf+DnvE1R5718ZZdne9AD
 KWTOX+c4XCyuDnDmyFbb3Xjkz/RTg7gSz/LrGZ+a+pUprTAEh3tLN5iZTU079bql6ke71lV61hA
 axj6bIDXYjcjheL0KDaiEkd6l7NyGKYq9UBz4rUlow5dG7A5rQ1fMliQn+Oljownx9BwvwYZ5pR
 W8G5EWJdepPii+bj/xG7DCndj0xBhhDUxvX7/SEdmzwwA4i1+mvhKFE0sXzx/MiyqSYzCBdw85w
 0tlr2QiXKeogHWYA6YBp/qljfp/y++DkDuF3rk/v0nLUKtke4xAX3gWIHv7Ecw/JKndh+yIUWtG
 OGKmFIVWGu7k0gIC2jQ==
X-Proofpoint-GUID: 6Hj5SCD4BQYRFH_XP16XW3wZuEe1IVXR
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978b5cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=85DL6j0X8AjJ5NvXHg4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270105

On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> A remoteproc booted during earlier boot stages such as UEFI or the
> bootloader, may need to be attached to without restarting the remoteproc
> hardware. To do this the remoteproc will need to check the ready and
> handover states in smp2p without an interrupt notification. Create
> qcom_smp2p_start_in() to initialize the shadow state without notifying
> clients because these early events happened in the past.
> 
> Add support for the .irq_get_irqchip_state callback so remoteproc can
> read the current state of the fatal, ready and handover bits.
> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index cb515c2340c1..c27ffb44b825 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>  	}
>  }
>  
> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> +{
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	char buf[SMP2P_MAX_ENTRY_NAME];
> +	struct smp2p_smem_item *in;
> +	struct smp2p_entry *entry;
> +	size_t size;
> +	int i;
> +
> +	in = qcom_smem_get(pid, smem_id, &size);
> +	if (IS_ERR(in))
> +		return;
> +
> +	smp2p->in = in;
> +
> +	/* Check if version is initialized by the remote. */
> +	if (in->version == 0)
> +		return;
> +
> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
> +		list_for_each_entry(entry, &smp2p->inbound, node) {
> +			memcpy(buf, in->entries[i].name, sizeof(buf));

Is there a reason for this copy at all?

[...]

> +	/* Check inbound entries in the case of early boot processor */

"in case a remote processor has already been started"?

Konrad

