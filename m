Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE682DF3CC
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769733990; cv=none; b=pMmk+2RqFmcPJy+G/AReht2P7HH2lokTEvwmcgRCi3ZMRseD4jpHp65ZxNK3YGEPLy1iLhLmQE8F08WLpodpqasGJffGlNGdQ1A6WYLK76KDZ5JQbHUSobZSKtbj/l6lmn3ZM17CgJKjhI/TNClDWYSIXGJBHqv0yqT/P/R8sNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769733990; c=relaxed/simple;
	bh=oyyf9ltil4JNZwVDsmmKZ2dGCvGdvBIZLHRNhDRkcJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrDaDNqc+eR3+Q+iBdMaIVxypqMQm1DiVScKNyJ1kR7yKHH3mXGUiz36MIdDnC9weKRyRwiLmEKNeC/MXTiGbLeTU1O6K5/DEOyCUGWAeeUv9xCkvt2hk0nNDuSl9zGSykZFa64OglwOx4dlibh2LWmETKbkB5pxKOHWcbBjFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+xshvHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqGZZwik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+xshvHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqGZZwik"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TJr4aT072318
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nTEddwWbBpyzhGVw7MJf2cPA
	VoFusYDp1MzoHCuEkZA=; b=C+xshvHFhdoxraRbFX6w53p9LdFOcwFv7XZxRmKJ
	ubzVKVUri9nEc2dX/u9m3DPxX76/9L55k+zjcRztQLhbUMPcob83HpcUgjDGVIEb
	ygKeKlPmyIumFfdoigEx/B2WKUfKe0oaU88J0VgbN6QfVxIUTLGyRIcPaw+CpTpM
	e4lMgMZLf7NyZFvZ2KvTlFQ2pMOBQ+9DKwo6uL7CKXfJGKDm/C7jBJG1kNVbpPT8
	jfCSLUGOR7nfVRMBe+cTfWjnnqV0vqA9UahOCKMzk03vGuBTJn4LOl6MJHqsWn5z
	pkOCbCDnn3KIh25rlj77N7qXIevm55TuxSp/ppUdWJAyBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3k8mm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:46:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso2617158eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 16:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769733982; x=1770338782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTEddwWbBpyzhGVw7MJf2cPAVoFusYDp1MzoHCuEkZA=;
        b=DqGZZwikCXToFmMxA8TTq6EL0zwjoQm4Ecgi+c1CK22o+ZfzNM3FtcXhLYmGMND5e8
         Vg53cTEcuY4X184Bw/23LPUCEiAdHpGeaS+uEIbPJarH9ZnW9yKwr12kVvSyCLVZfh+m
         9o3DvC562CIKwJD5r+oOapULfcr9ikgNoCGGmSYvdH22+2EWFHJImTVtE0hbENVseJKY
         J24EZlKM1a7MVBNjn1x7HM1fA6fJprqCyJBJjz2kB448xrkj6sx10BJY0gguKdn0YtkV
         Y2a4WHeDKaPeIVudtdHEyWn3p7MLvoVFsJWtv9G06xD2FuzWIVlLZSDYta0kHQH6l2C0
         5zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769733982; x=1770338782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTEddwWbBpyzhGVw7MJf2cPAVoFusYDp1MzoHCuEkZA=;
        b=VsBwkq0pamLj7eV2WMUiaEhgAlJwwhiYp6yxH2pUK1e1Ec2eqoAz5xaISuOeCsU4X2
         x4DQb1knWwb571nTXJ50KpouyTr7EzE8hqyt+q+7i6WCObocF+qvKjnJyyRpl/X2swS4
         ZkkbyRq6KR46hgIEXYQyjgFu+d1vzO7GgUbWraOyeCWHbis1jO0yyGkGAytOezW1Ixqr
         18ZwGI+dycdZVLNbTQ3Umde13T+H6rCQlMIllDRnxfc8vkpOxG4Eq0rsNq2v9JVkPoIh
         9g/FwKaQYNx2SORzp7uA6XcEy3zvWCUiAChlkxoZjf674gR7XbDlRUmjN1MYIDEzCLqQ
         u9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXxslMY/hQEjcxVYuBxxpFxayAAD6Gri8bHZ1nXbe5OpczHPLDV+OlK2NbA6NxKK69PrkcxUiNiJHcVhXCVy1gJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDm7Pem35KbjCZPgNemWr2vWS42IDkzapssEugH3iaa/Zi3MwX
	/sM7zHMZNtU7h1X7MFuLFMwvgSLbgprt+pi/8tquORIQtjk4nKZKvgWIXeSmGHjLu82DciBrfV3
	SNn2k7cp60RCZGgvkxzeJIhL/nr2BtHnMGyVGdQaBrmMb7ZOlsfKbTb8kQxZbOzBOtNZT3SGD
X-Gm-Gg: AZuq6aJ0EM0w0IGA2m51FyM5EdmqYekFUKIfowbCCgHxI4E/ouonNUDDAUXuRuJNLa+
	7Fw0UgM49/0cagHk7LYnc0czdhpZTdS+ImnP5LN0hglqXYR68jq5m8o40qIKGyygtFQhibJcsAo
	PiaAupsgFfaDU4ffwFetXqtVw5/EendGSMBsz4YNv+4iTY1naO0K+Q24y/YkiOFgMH4bpH+l3Ya
	axPMu6LS3wyokM3pldQe3vOKFwgULSfaLDAPZg3W3twV0n/gPFxPtmfEjCoT5poT6kQFf4+aRI0
	DOntaUxtGOXIlFz/FrtwnMhW6409dGGYThOMIlaf6Cu0l7nSxpODIExHFdzGlCa1VG2al+N2nKv
	JmY3qp5IGry1Dutv9DVdrzntqpReAa0TEGb8DsU6ibg+uMBIYdkafGysBdbaWwY4=
X-Received: by 2002:a05:7300:bc11:b0:2b7:97b0:82b3 with SMTP id 5a478bee46e88-2b7c8632963mr511560eec.5.1769733982333;
        Thu, 29 Jan 2026 16:46:22 -0800 (PST)
X-Received: by 2002:a05:7300:bc11:b0:2b7:97b0:82b3 with SMTP id 5a478bee46e88-2b7c8632963mr511551eec.5.1769733981756;
        Thu, 29 Jan 2026 16:46:21 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ec51csm9187299eec.10.2026.01.29.16.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:46:21 -0800 (PST)
Date: Thu, 29 Jan 2026 16:46:19 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
Message-ID: <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697bff62 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HqoV7rsciEZpOya5PewA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 5pqdUZtRx_05V0QO0x7mE5MQ8dl-B73Y
X-Proofpoint-ORIG-GUID: 5pqdUZtRx_05V0QO0x7mE5MQ8dl-B73Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMyBTYWx0ZWRfX1aSOJtp2aeog
 b7UsHTQbI/U0KcaCJ5/k5JJNzvx8XA4JGLdFcHE+E6A8c8c1wca6EqJYjVayzrsHbNV9YH2zOV7
 f1dPDymbB7zdiea1yHycnj9sekXtNXhtoxJwVKHKNpOBFoPjb871L8IWxxPvgKCEj0zQF4sKBwO
 T4IqrCpvNt06WPh1L6Gy/ztSSQ/pmHl+w51IkdUqmg4OYrnpaDkDSXP5sOW33vXa751AMRXTDre
 RJqf03Dmx+agPdG3Pay+jjrzbEZHUsLSpmwGzS3zxpmKv8OhyxFZBLn5CMwOnT5x0rK0fd2eEJv
 CdjpOJTZTB/alY4Kfd/jKh0Zd2TzA7CGzjkF3OBAcyuhbCBb05PK7r60ZvalY5D/R+BUMzEh/D8
 RJqJPgHGrm3qVEktmcF87qtfnjjGecsWHp4c9vYRB5Bg9ADpyy8PK6Vd3iA39Mx5olW2ZycOCF6
 0m+dGkbOrbTrNs1lh7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300003

On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
> 
> On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
> > On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
> > > From: Chris Lew <chris.lew@oss.qualcomm.com>
> > > 
> > > A remoteproc booted during earlier boot stages such as UEFI or the
> > > bootloader, may need to be attached to without restarting the remoteproc
> > > hardware. To do this the remoteproc will need to check the ready and
> > > handover states in smp2p without an interrupt notification. Create
> > > qcom_smp2p_start_in() to initialize the shadow state without notifying
> > > clients because these early events happened in the past.
> > > 
> > > Add support for the .irq_get_irqchip_state callback so remoteproc can
> > > read the current state of the fatal, ready and handover bits.
> > > 
> > > Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> > > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > > ---
> > >   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 55 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> > > index cb515c2340c1..c27ffb44b825 100644
> > > --- a/drivers/soc/qcom/smp2p.c
> > > +++ b/drivers/soc/qcom/smp2p.c
> > > @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
> > >   	}
> > >   }
> > > +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> > > +{
> > > +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> > > +	unsigned int pid = smp2p->remote_pid;
> > > +	char buf[SMP2P_MAX_ENTRY_NAME];
> > > +	struct smp2p_smem_item *in;
> > > +	struct smp2p_entry *entry;
> > > +	size_t size;
> > > +	int i;
> > > +
> > > +	in = qcom_smem_get(pid, smem_id, &size);
> > > +	if (IS_ERR(in))
> > > +		return;
> > > +
> > > +	smp2p->in = in;
> > > +
> > > +	/* Check if version is initialized by the remote. */
> > > +	if (in->version == 0)
> > > +		return;
> > > +
> > > +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
> > > +		list_for_each_entry(entry, &smp2p->inbound, node) {
> > > +			memcpy(buf, in->entries[i].name, sizeof(buf));
> > Is there a reason for this copy at all?
> I don't see a compelling reason. This code snippet is same as present in
> qcom_smp2p_notify_in().

My understanding was that we do this copy because we don't want to do a
strcmp on memory that the remote could change at any time. Maybe it's
overkill but I thought it was considered good practice and as Deepak
mentioned, it is similarly present in qcom_smp2p_notify_in().

> > [...]
> > 
> > > +	/* Check inbound entries in the case of early boot processor */
> > "in case a remote processor has already been started"?
> This i can update in case new patch set is required.
> > Konrad
> > 
