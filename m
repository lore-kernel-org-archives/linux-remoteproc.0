Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491EF21CFEF
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908848; cv=none; b=H4ibB1YyAEPpA3T0phu5bdWYmTafkMJNpxKWVARXNyDadFU6ImYgQQNvdHBOUQMfe6m/3ev6D78FsDv38+Y1BqYHAV4suEvmigZdhGau0muW4n6aJAn2RbZOU3gMxpDg+z6iF7r0H3DUVo2sIXnN7xw1yP/yxw/Ngkq4ctQENC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908848; c=relaxed/simple;
	bh=7bptb2G06hdAdq2PKR7nNXkha4mvqjQyF5eSFMelo0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/YH5gsZ1Yj+zkVQI47FqgSzvW0F2cMuJO/FG0xn5BrqkYsKbC2Ndb/FZmmuhsGMkMoLOFGzYQKAPjv2AvHZuqZrWkdIao37PeQOjg82hg82E5cffeUz8YoZqLFzYDILDtCrS+gWCpbLojYg5kmsEhRp0+flLz3cw96HA+tJU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M50ZSHpC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M50ZSHpC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803mok018494
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 07:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hlhli3jcVHPyvAqlPzswYc3dq0CKsbFj/LuCjRLAF2o=; b=M50ZSHpCm4W/U4ER
	Fx7ZUXvhLcdp5KzduxqkqZO6h6RTz15aoQ/f1S0+izqeR5bmNf9rfzhmAH6RskVw
	U0mIhgDrWPaDyzkmS3rlDcB3OFjQb4r6SNxwKyjG+asItsozpnyku8nlaD0caSAL
	1pfC1Ka3LPWuj9I4LkQgYJcZZSXQ3KwWQRAggrQUcTgjaXSLLA+Oz7/WCiyWUiF6
	1riERq/KpielhVlte0+/8h4dOZhMF0oPsZECT/4bjgkrrKKzeC49NfbNEpM9ZZdy
	tSQ6dItWxYUI1Sbzr4NunFfjZ/HoQzFbvEr+AtydOnEQhLRsw8NMjVHtnmc6mYNu
	F12Kiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0ndr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 07:34:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e538b5f23so79668965ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 00:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908845; x=1760513645;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hlhli3jcVHPyvAqlPzswYc3dq0CKsbFj/LuCjRLAF2o=;
        b=N3xyN1KDQa/pk1LzbbYsBOklzjU6w5FCpgO/22LcExxlwaUwNYhV4o78uAW+VBnlN9
         oomqeiPQhjm4fDJX0U2uyn4X14v7jYX+kYfu+5zSU1b4gu6kR/hFJVZgT1zEZnNdMuLL
         oAx6DPSrD/Q9MLEz0lWaVkSNFFrgvuDJQ8qHWLduPznhNoxZqAOoXst5kspHnNpWSR7A
         OCbkKMdo16sJLYU1MkE5/fFirJhraQV14XzPshZSMzMS3GvE7KwSOpZ9288F+DUhyIWT
         EIld2hISAErm8V0aCg04/hbr3NgzV7MzAhm679HvFKUGt4tplFayALWDR69GqiCYzM6n
         IOjg==
X-Forwarded-Encrypted: i=1; AJvYcCWHyJ+1MyFsHRO8IulaqVgRsdLP4BMFmziFufXHXKJt6KGUcy7teawCQ8KqFpL/F93POcBYcI41/1PxNMSo3E6q@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXjUfV6NJaQ+a/Jt4x5jQZltGEEavJ8y5410eNimFu0kY0jL5
	HbokxURe8Zu8oJeIbucYgazhxOKE5+GHDN5YC/O5p4hxAmzDnndoueogTp0dvgEgdSadKQo4gsl
	T6pfhP0SZ5SUs0qybw7tTmrDnP6NQ5puclQ8HhXEOA6hFHdtzvn3db6vrCY68gNIBHn4kODm7
X-Gm-Gg: ASbGncsmpoV+DL3hvjBfdg1mbj1cFigwJf1mIjOrfsNAJQSyOnSd8JZBBD69W83ZTnn
	pCDXxO9m6LtajEAFN5Gmvk+DccSyUL76+Or7F+Ivt17FF/iIVrpcnw9ERiL+jP3JCTdaca7Rn8E
	wDc0gHuY62QVPxCPPBHXKJGDq+7rTaDJ9BErfr0JF58XsunSR8kgnaTQ6cZZdneYzYZHtQW2WTj
	b8VdXExzkaQeF+amPdJe+ppbeAirznYlvAoI8f5Dc+iaLj04AxBlYqOROJz3pG6jX3pIyARC/Z2
	HE0Doi7zGeKA8+d4PbnZp8HeI9tAUv0AMUOWCbeOwgBHSjrDdafAGvCAX5clCKm+/EcnWgob
X-Received: by 2002:a17:903:1b64:b0:240:9dd8:219b with SMTP id d9443c01a7336-290272e6eacmr33271175ad.49.1759908844508;
        Wed, 08 Oct 2025 00:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+KlUdtRRvYkXMICVc9fL+WCUzUirgQjCnrKXBz5Lo7RGote9A2zVrM+JHyCOFQn/qLfxNg==
X-Received: by 2002:a17:903:1b64:b0:240:9dd8:219b with SMTP id d9443c01a7336-290272e6eacmr33270805ad.49.1759908843871;
        Wed, 08 Oct 2025 00:34:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d135d71sm189292385ad.58.2025.10.08.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:34:03 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:03:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <20251008073357.vjvmeatrzrphewnn@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-10-de841623af3c@oss.qualcomm.com>
 <hwjfb7rudsdsxxoluxyu4n7wumzyyn73xnzi2ww4fkkfkpg3a3@esvajcrmhcus>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hwjfb7rudsdsxxoluxyu4n7wumzyyn73xnzi2ww4fkkfkpg3a3@esvajcrmhcus>
X-Proofpoint-GUID: cmesjQydL5yOE10ETxF3IKnvncaC5wSS
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e613ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=1wm0BNpoZKb8wzEvCIcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: cmesjQydL5yOE10ETxF3IKnvncaC5wSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX7NjZ4BZdYaOO
 LmwR+M4VeULa04jj8R/TWCfIwxQ5sgODIkiuh89qtaGO52fvEI86a7PW1OFL6Y3eaW5UW6iPVZ5
 it+Yw13vBQSvud+MyoYh6hpkZHZUfKtfwADg86WxQppu3n1txBv9pL5nXQHCwS/CPpNCu2Ajy6O
 MZ8qp//0TAEC6qJrgOb/WXH1g/XV6sWlK1GLO8V2OvEYRVEZjOci9YdVvc5niZ5WHQtY2ng8Yen
 Y2zk3DGcRg7KO9EDTsSTSgPrAz+EsGvKXGpq1G86tq+se58Na1duBTh76C8t+T3Ws4YRK77tcmo
 wQul+4ZXcIaOK01kBBWVXOzW7HIbch0oJsaxSUk5pYk989j6OYZV3BaCgu6VNq28ZFWjopCgcsd
 lh6EGbqveVJpVHumHXpUWxs7Vw0JIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On Tue, Oct 07, 2025 at 02:48:26PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:55PM +0530, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on static and dynamic resources for
> > it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> > or older QHEE hypervisor, all the resources whether it is static or
> > dynamic, is managed by the hypervisor. Dynamic resources if it is
> > present for a remote processor will always be coming from secure world
> > via SMC call while static resources may be present in remote processor
> > firmware binary or it may be coming from SMC call along with dynamic
> > resources.
> > 
> > Remoteproc already has method like rproc_elf_load_rsc_table() to check
> > firmware binary has resources or not and if it is not having then we
> > pass NULL and zero as input resource table and its size argument
> > respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> > present then it should pass the present resources to Trustzone(TZ) so that
> > it could authenticate the present resources and append dynamic resource
> > to return in output_rt argument along with authenticated resources.
> > 
> > Extend parse_fw callback to include SMC call to get resources from
> > Trustzone and to leverage resource table parsing and mapping and
> > unmapping code from the remoteproc framework.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 58 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 46a23fdefd48..ed7bd931dfd5 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -34,6 +34,7 @@
> >  #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
> >  
> >  #define MAX_ASSIGN_COUNT 3
> > +#define MAX_RSCTABLE_SIZE	SZ_16K
> >  
> >  struct qcom_pas_data {
> >  	int crash_reason_smem;
> > @@ -412,6 +413,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
> >  	return pas->mem_region + offset;
> >  }
> >  
> > +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> > +{
> > +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> > +	struct qcom_pas *pas = rproc->priv;
> > +	struct resource_table *table = NULL;
> > +	void *output_rt;
> > +	size_t table_sz;
> > +	int ret;
> > +
> > +	ret = qcom_register_dump_segments(rproc, fw);
> > +	if (ret) {
> > +		dev_err(pas->dev, "Error in registering dump segments\n");
> > +		return ret;
> > +	}
> > +
> > +	if (!rproc->has_iommu)
> > +		return ret;
> > +
> > +	ret = rproc_elf_load_rsc_table(rproc, fw);
> > +	if (ret)
> > +		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
> > +
> > +	table = rproc->table_ptr;
> > +	table_sz = rproc->table_sz;
> 
> Are 'rproc->table_ptr' and 'rproc->table_sz' guaranteed to be 0 in the case of
> above error?

As far as remote processor firmware does not have resource table, it
will be 0.

> 
> > +
> > +	/*
> > +	 * Qualcomm remote processor may rely on static and dynamic resources for
> > +	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> > +	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
> > +	 * is managed by present hypervisor. Dynamic resources if it is present for
> > +	 * a remote processor will always be coming from secure world via SMC call
> > +	 * while static resources may be present in remote processor firmware binary
> > +	 * or it may be coming from SMC call along with dynamic resources.
> > +	 *
> > +	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
> > +	 * or not and if it is not having then we pass NULL and zero as input resource
> > +	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
> > +	 * and this is even true for Qualcomm remote processor who does follow remoteproc
> > +	 * framework.
> > +	 */
> > +	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
> > +					 &output_rt_size);
> > +	if (ret) {
> > +		dev_err(pas->dev, "error %d getting resource_table\n", ret);
> 
> 	"Error in getting resource table: %d\n"
> 
> > +		return ret;
> > +	}
> > +
> > +	kfree(rproc->cached_table);
> > +	rproc->cached_table = output_rt;
> > +	rproc->table_ptr = rproc->cached_table;
> > +	rproc->table_sz = output_rt_size;
> > +
> > +	return ret;
> 
> 	return 0;
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
