Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E029BDB5
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277139; cv=none; b=KUbsHI2hjgZWPDtB6FXPb9+GTK26M79vhGGl4S56NF9KdaaWPUFUAoo7thHT2gqhYhtuhL448AvcM/dGASDhYNCXbLZHf/9ua0dbk4a8eo9IoXKExyPn6SwfgssCznMJMaVJld4u9MH8ltq7suxtEkAvDGvyJoMcDSbGH8Ut3sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277139; c=relaxed/simple;
	bh=zb/ZLKLf9wUwr6KjOKa0bbhSYACXfCfSjGx26SED+yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX0sIw95j0Ua94Tv4EYL4ljqfe124XI6FEGB8qco97y3kBAeIirNHFbVuU46IAUTpwe9gzJ6A+prfXAPCt5Mj4iwW2LJNf741MVT85SWXKwAEQMPfmvpUyI3LVNn85Mg8JWbTEvLMcm0o5Ges7OTrlAnuzOCEMHTjYahZWKSRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3YFQRi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwI4fzIO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3YFQRi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwI4fzIO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99N7DR3966561
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Dec 2025 10:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LdtJ1kATu6fNjMp4apfkB/xV
	CmHcGExb5AFIpVk5piY=; b=k3YFQRi2s2uU0Jnkhkou6koBJejMtY1CieizLbrk
	q0syuAVKhXQ6gJO+S4aQhL326mAjeHxj+Oq8es/9liA3dG6rCBGcXXjtn5auXpZv
	oMQwnOSQnCNJ5rElDGVMs4KxNUc31ueA8VrttUAbkm62L87moX00SThgNY8J19fz
	r5UzOw3sRMEOYy6MpIJqxfidJHxulmKGkyse3RTVTWLOdG9JOKVyMUl8hAqDVlrA
	wx34zkqcBljyraBxdKU0s298oSmGYzIj2uUsldknKg2YftpANfpCzt8qWItsFymp
	2+JphNmaLMwG9Bb4NubAXIxCGxYMHkORO3kSf3BGbE2OOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfrbs2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 10:45:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29e6b269686so28454035ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 02:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765277133; x=1765881933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdtJ1kATu6fNjMp4apfkB/xVCmHcGExb5AFIpVk5piY=;
        b=QwI4fzIO2FE/5Zz/MYJflWD1X00pmMY5I5De/ljHtcgFSROxaWKCEA0IRGej/eLPTF
         mukWncq5vfBYTc2WNMrAZgk57GvvvdF5jgOT+J9rbKIG1rTvctVJjtmFip9xuvD0jy4R
         ef0IUViXXRJ0dmdj5e/vkvBDsBe8REQLbIHowauaLcqxm9eFObp+hKwikRNLev35fGgc
         4MWQOd/6f3U1FkulayCoozjeij7r8QBGdAFwhBn3x7yAteGOM3/38BOZHVXqdVdEecGT
         zTGARPvJ/Ux8wL8BDbMZyANUgK+mJ+VVCojKoTLHOdjeWBix5xTOsQ4tQt7tZzYZwR5/
         F+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277133; x=1765881933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdtJ1kATu6fNjMp4apfkB/xVCmHcGExb5AFIpVk5piY=;
        b=Wv/+MAJ/PzFllYLkNBVRZMiloZHSWLjKHv/A8ZFVpoAqvQlmuRy6Ca58aOWgMSXj3V
         Wy7mtWQDSXKe/2+NU0WaUvDsJn+dGqxpqg9yqt/bHB94BinnJvN8fE+mpews6SPpJ4NQ
         WGpxJ+x6tt+b7VAFy3Ybk80zz1+PO5uFdO1HdfKPRYPmGFk19vP5G4niIoZ0nXpl3EVv
         7pfWT/gt0hc/KtfDNHu8MG8yPFCNqqFQ0mJIMndX3/dIrzMUTppIBxy+SNxm+pYth7qs
         jLeqCacWvnveiM8j0sgsIw8/4wcQLZe0JSjPBi0UIHZvMnKNlacP+0H5I3XCelI9vkNe
         bqRw==
X-Forwarded-Encrypted: i=1; AJvYcCWjdiCkxLDlZF94LefGCWXYt+phnrsruSbfB41Eh5AFOxjZ/RhS6JBWHZOyZQshzSA7l3hEikeMS0FKoIQ8l4d/@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEpkTRfjTFLLoYGbpIT7ExZ8UtnacxKDsUFBPabDZrWsiiwtR
	k2QhZQc0Rv+5WEqZh71KKMt1v4NsrKVVF4VYeVIlXEXnQKnOiS6YeaeEMIrwFROhKHNXz9QSqmV
	3NPkY2VYXwww4sV316Zb2UdhfFz7b3vrbK1BdaCZAXb8F+tHxVNKFfLxIosONuULU1WWGIX4N
X-Gm-Gg: AY/fxX4UZiEEekOlcFCi0hd3drMNIDYR3un4H1122TWpXmIXIles25Cw6Aq8x5psx5U
	gyqwNapsjiXx8zAxZu9BNl5gcHMLCkoXDvujg91jPuCsucou7cQuXrpPQsr1gARyWmwlCir6NLq
	/y2QCcDkdebjRYQ2vcbPyczSlLWAA1yNfaEE4SZyJTtB+rEz3oBjgsSKhV8UZ6K/aU4JazwfjJw
	WMDKUjhneGGMZSjWb9mQCEriGgcqNJRl4tm9+NzD5RTFdPCJV9zY5+GTOjdHmdlfD3s7MsjfbZJ
	KjS6mqXs++jMF384g/7MTG2Iq0h0XA5gs0ILYHu+qFxRAnLQYAgEmECv/OA5WF0mt6lQiiBfcpD
	4LaBfiMEywmMpHjkbqtzxjCvzOZ/OQiPTN2n7
X-Received: by 2002:a17:902:f546:b0:295:28a4:f0aa with SMTP id d9443c01a7336-29df610b0fbmr97810795ad.43.1765277132613;
        Tue, 09 Dec 2025 02:45:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqDPrLf5jzJilr902+CpdhMK5xRewGYqh+OWDhbRk1+Hl8Nis0ssZ7qmfYamBmZZPW3dBWXA==
X-Received: by 2002:a17:902:f546:b0:295:28a4:f0aa with SMTP id d9443c01a7336-29df610b0fbmr97810645ad.43.1765277131857;
        Tue, 09 Dec 2025 02:45:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f1c4sm151979625ad.66.2025.12.09.02.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:45:31 -0800 (PST)
Date: Tue, 9 Dec 2025 16:15:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251209104525.wtevrvyxqomh63hg@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <igedl65pnenmeiybzktsw7toeqtb5mhbk7ks5dkavevko6e5yq@2tyakacovx7f>
 <20251208164926.cwe7arncr6tnan5f@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208164926.cwe7arncr6tnan5f@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3NSBTYWx0ZWRfX74RSig37rKuc
 pxmpjplwcTujq9M4Ah3yCDFsdYmY0ywUpLIGRADYjyw+hDcg5ytqRVlINdMPm5Voy7sSj8i8KNl
 /4aIDekAHmDhr6RAqX0o94C5by+I7WGexi5G5Fe3FZIDzH6YW6jBnGxoRtHADej7uuwhfjo6kma
 4B6hhbN/K+2F8q6927nclrqurDa0yoxE9jPPRuSgvjuoLVhWwxtBUviQgoLUUZwdNmYVMGlvyk1
 KihRQ3/d/+2jHUtP3TQFCkbRLLqJOji1CQ3KLsImYBvYF+UbODjIgNHoEzNkOcSqeTliD7n3pSu
 GX6MSO8NPa0k/ZFtbNJ3Kgrk48yUcdHzdzQ+mNx3OMPAcYoloNwPC3tA3jRx4/ljigyvKDBKUGj
 EXu0lHm968hf3wKJ4DSplNELpzKnxQ==
X-Proofpoint-ORIG-GUID: R3HhRDB7vJmOHQCMFyVRzAzYU8aCW3Qb
X-Proofpoint-GUID: R3HhRDB7vJmOHQCMFyVRzAzYU8aCW3Qb
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6937fdce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uDHemL44re2y6JaO7sYA:9
 a=fXJTwrYLEpNIDeH8:21 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090075

On Mon, Dec 08, 2025 at 10:19:26PM +0530, Mukesh Ojha wrote:
> On Fri, Dec 05, 2025 at 04:40:51PM -0600, Bjorn Andersson wrote:
> > On Fri, Nov 21, 2025 at 04:31:13PM +0530, Mukesh Ojha wrote:
> > > Qualcomm remote processor may rely on Static and Dynamic resources for
> > > it to be functional. Static resources are fixed like for example,
> > > memory-mapped addresses required by the subsystem and dynamic
> > > resources, such as shared memory in DDR etc., are determined at
> > > runtime during the boot process.
> > > 
> > > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > > hypervisor, all the resources whether it is static or dynamic, is
> > > managed by the hypervisor. Dynamic resources if it is present for a
> > > remote processor will always be coming from secure world via SMC call
> > > while static resources may be present in remote processor firmware
> > > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > > with dynamic resources.
> > > 
> > > Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> > > not check whether resources are present in their remote processor
> > > firmware binary. In such cases, the caller of this function should set
> > > input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> > > framework has method to check whether firmware binary contain resources
> > > or not and they should be pass resource table pointer to input_rt and
> > > resource table size to input_rt_size and this will be forwarded to
> > > TrustZone for authentication. TrustZone will then append the dynamic
> > > resources and return the complete resource table in output_rt
> > > 
> > > More about documentation on resource table format can be found in
> > > include/linux/remoteproc.h
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_scm.c       | 158 +++++++++++++++++++++++++++++++++
> > >  drivers/firmware/qcom/qcom_scm.h       |   1 +
> > >  include/linux/firmware/qcom/qcom_scm.h |   4 +
> > >  3 files changed, 163 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > > index 84498d0d2f0c..c4420b79fb57 100644
> > > --- a/drivers/firmware/qcom/qcom_scm.c
> > > +++ b/drivers/firmware/qcom/qcom_scm.c
> > > @@ -27,6 +27,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/reset-controller.h>
> > > +#include <linux/remoteproc.h>
> > >  #include <linux/sizes.h>
> > >  #include <linux/types.h>
> > >  
> > > @@ -111,6 +112,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
> > >  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
> > >  };
> > >  
> > > +enum qcom_scm_rsctable_resp_type {
> > > +	RSCTABLE_BUFFER_NOT_SUFFICIENT		= 20,
> > > +};
> > > +
> > >  #define QSEECOM_MAX_APP_NAME_SIZE		64
> > >  #define SHMBRIDGE_RESULT_NOTSUPP		4
> > >  
> > > @@ -766,6 +771,159 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> > >  }
> > >  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
> > >  
> > > +static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt, size_t input_rt_size,
> > > +					void **output_rt, size_t *output_rt_size)
> > 
> > output_rt is not going to be modified, only its content, so it can be
> > void * (single pointer).
> > 
> > > +{
> > > +	struct qcom_scm_desc desc = {
> > > +		.svc = QCOM_SCM_SVC_PIL,
> > > +		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
> > > +		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
> > > +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> > > +		.args[0] = pas_id,
> > > +		.owner = ARM_SMCCC_OWNER_SIP,
> > > +	};
> > > +	void *input_rt_buf, *output_rt_buf;
> > 
> > I do one prefer one variable per line, preferably in reverse xmas order.
> 
> Ack.
> 
> > 
> > > +	struct resource_table *rsc;
> > 
> > Calling this "empty_rsc" will make its purpose obvious.
> 
> Ack.
> 
> > 
> > > +	struct qcom_scm_res res;
> > > +	int ret;
> > > +
> > > +	ret = qcom_scm_clk_enable();
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = qcom_scm_bw_enable();
> > > +	if (ret)
> > > +		goto disable_clk;
> > > +
> > > +	/*
> > > +	 * TrustZone can not accept buffer as NULL value as argument Hence,
> > > +	 * we need to pass a input buffer indicating that subsystem firmware
> > > +	 * does not have resource table by filling resource table structure.
> > > +	 */
> > > +	if (!input_rt)
> > > +		input_rt_size = sizeof(*rsc);
> > 
> > If you overwrite input_rt here, you don't need to repeat this
> > conditional below, like:
> > 
> > 	struct resource_table empty_rsc = {};
> > 	
> > 	...
> > 	
> > 	if (!input_rt) {
> > 		input_rt = &empty_rsc;
> > 		input_rt_size = sizeof(rsc);
> > 	}
> > 	
> > 	qcom_tzmem_alloc(input_rt_size)
> > 	
> > 	memcpy(input_rt_buf, input_rt);
> 
> Ack.
> 
> > 
> > > +
> > > +	input_rt_buf = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
> > > +	if (!input_rt_buf) {
> > > +		ret = -ENOMEM;
> > > +		goto disable_scm_bw;
> > > +	}
> > > +
> > > +	if (!input_rt) {
> > > +		rsc = input_rt_buf;
> > > +		rsc->num = 0;
> > > +	} else {
> > > +		memcpy(input_rt_buf, input_rt, input_rt_size);
> > > +	}
> > > +
> > 
> > Reading this patch once more, it looks reasonable, but few of the things
> > in this function actually depend on *output_rt_size, yet we perform them
> > in the loop below.
> > 
> > We're expecting, with some certainty, that this sequence will be called
> > more than once, so I think it would be preferable to slice this
> > differently, and only repeat the <loop></loop> part.
> > 
> > <loop>
> 
> Ack, I will move all the clock, bw voting and mentioned retry(on -EOVERFLOW) loop
> to the caller of this function.
> 
> > 
> > > +	output_rt_buf = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
> > > +	if (!output_rt_buf) {
> > > +		ret = -ENOMEM;
> > > +		goto free_input_rt_buf;
> > > +	}
> > > +
> > > +	desc.args[1] = qcom_tzmem_to_phys(input_rt_buf);
> > > +	desc.args[2] = input_rt_size;
> > > +	desc.args[3] = qcom_tzmem_to_phys(output_rt_buf);
> > > +	desc.args[4] = *output_rt_size;
> > > +
> > > +	/*
> > > +	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
> > > +	 * size.
> > > +	 *
> > > +	 * if passed 'output_rt_size' buffer size is not sufficient to hold the
> > > +	 * resource table TrustZone sends, response code in res.result[1] as
> > > +	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call with
> > > +	 * output_rt buffer with res.result[2] size.
> > > +	 */
> > > +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> > > +	*output_rt_size = res.result[2];
> > > +	if (!ret)
> > > +		memcpy(*output_rt, output_rt_buf, *output_rt_size);
> > > +
> > > +	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
> > > +		ret = -EAGAIN;
> > 
> > </loop>
> > 
> > > +
> > > +	qcom_tzmem_free(output_rt_buf);
> > > +
> > > +free_input_rt_buf:
> > > +	qcom_tzmem_free(input_rt_buf);
> > > +
> > > +disable_scm_bw:
> > > +	qcom_scm_bw_disable();
> > > +
> > > +disable_clk:
> > > +	qcom_scm_clk_disable();
> > > +
> > > +	return ret ? : res.result[0];
> > 
> > Is there a risk that res.result[0] will carry something meaningful to
> > the caller (which will be misinterpreted)?
> 
> No, its just to align with other SMC call, it will always have 0 value
> on success.
> 
> > 
> > > +}
> > > +
> > > +/**
> > > + * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> > > + *				  for a given peripheral.
> > > + *
> > > + * Qualcomm remote processor may rely on both static and dynamic resources for
> > > + * its functionality. Static resources typically refer to memory-mapped addresses
> > > + * required by the subsystem and are often embedded within the firmware binary
> > > + * and dynamic resources, such as shared memory in DDR etc., are determined at
> > > + * runtime during the boot process.
> > > + *
> > > + * On Qualcomm Technologies devices, it's possible that static resources are not
> > > + * embedded in the firmware binary and instead are provided by TrustZone However,
> > > + * dynamic resources are always expected to come from TrustZone. This indicates
> > > + * that for Qualcomm devices, all resources (static and dynamic) will be provided
> > > + * by TrustZone via the SMC call.
> > > + *
> > > + * If the remote processor firmware binary does contain static resources, they
> > > + * should be passed in input_rt. These will be forwarded to TrustZone for
> > > + * authentication. TrustZone will then append the dynamic resources and return
> > > + * the complete resource table in output_rt.
> > > + *
> > > + * If the remote processor firmware binary does not include a resource table,
> > > + * the caller of this function should set input_rt as NULL and input_rt_size
> > > + * as zero respectively.
> > > + *
> > > + * More about documentation on resource table data structures can be found in
> > > + * include/linux/remoteproc.h
> > > + *
> > > + * @ctx:	    PAS context
> > > + * @pas_id:	    peripheral authentication service id
> > > + * @input_rt:       resource table buffer which is present in firmware binary
> > > + * @input_rt_size:  size of the resource table present in firmware binary
> > > + * @output_rt:	    buffer to which the both static and dynamic resources will
> > > + *		    be returned.
> > > + * @output_rt_size: TrustZone expects caller should pass worst case size for
> > > + *		    the output_rt.
> > > + *
> > > + * Return: 0 on success and nonzero on failure.
> > > + *
> > > + * Upon successful return, output_rt will have the resource table and output_rt_size
> > > + * will have actual resource table size,
> > > + */
> > > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > > +			       size_t input_rt_size, void **output_rt,
> > > +			       size_t *output_rt_size)
> > > +{
> > > +	unsigned int retry_num = 5;
> > > +	int ret;
> > > +
> > > +	do {
> > > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > 
> > I'd prefer the output buffer and size to be carried in a local variables
> > until we determine success, to avoid overwriting the caller's size with
> > some bogus number and return a pointer to freed memory.
> 
> Sure.
> 
> > 
> > Wouldn't be unreasonable to return an ERR_PTR() with the allocated
> > buffer, instead of returning through the reference.
> 
> We anyway have to return the size through reference, why not do the same for 
> allocated buffer as well..


Tried to take care most of the comments apart from above one., let me know if
below is fine..

---------------------------------------o<---------------------------------------

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 4ce892d8fb25..a589961f8225 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,6 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/remoteproc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
@@ -111,6 +112,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+enum qcom_scm_rsctable_resp_type {
+	RSCTABLE_BUFFER_NOT_SUFFICIENT		= 20,
+};
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -766,6 +771,171 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
+static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt,
+					size_t input_rt_size, void *output_rt,
+					size_t *output_rt_size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
+		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	desc.args[1] = qcom_tzmem_to_phys(input_rt);
+	desc.args[2] = input_rt_size;
+	desc.args[3] = qcom_tzmem_to_phys(output_rt);
+	desc.args[4] = *output_rt_size;
+
+	/*
+	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
+	 * size.
+	 *
+	 * If passed 'output_rt_size' buffer size is not sufficient to hold the
+	 * resource table TrustZone sends, response code in res.result[1] as
+	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call
+	 * with output_rt buffer with res.result[2] size however, It should not
+	 * be of unresonable size.
+	 */
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (res.result[2] > SZ_1G) {
+		ret = -E2BIG;
+		return ret;
+	}
+
+	*output_rt_size = res.result[2];
+	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
+		ret = -EOVERFLOW;
+
+	return ret ? : res.result[0];
+}
+
+/**
+ * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
+ *				  for a given peripheral.
+ *
+ * Qualcomm remote processor may rely on both static and dynamic resources for
+ * its functionality. Static resources typically refer to memory-mapped addresses
+ * required by the subsystem and are often embedded within the firmware binary
+ * and dynamic resources, such as shared memory in DDR etc., are determined at
+ * runtime during the boot process.
+ *
+ * On Qualcomm Technologies devices, it's possible that static resources are not
+ * embedded in the firmware binary and instead are provided by TrustZone However,
+ * dynamic resources are always expected to come from TrustZone. This indicates
+ * that for Qualcomm devices, all resources (static and dynamic) will be provided
+ * by TrustZone via the SMC call.
+ *
+ * If the remote processor firmware binary does contain static resources, they
+ * should be passed in input_rt. These will be forwarded to TrustZone for
+ * authentication. TrustZone will then append the dynamic resources and return
+ * the complete resource table in output_rt.
+ *
+ * If the remote processor firmware binary does not include a resource table,
+ * the caller of this function should set input_rt as NULL and input_rt_size
+ * as zero respectively.
+ *
+ * More about documentation on resource table data structures can be found in
+ * include/linux/remoteproc.h
+ *
+ * @ctx:	    PAS context
+ * @pas_id:	    peripheral authentication service id
+ * @input_rt:       resource table buffer which is present in firmware binary
+ * @input_rt_size:  size of the resource table present in firmware binary
+ * @output_rt:	    buffer to which the both static and dynamic resources will
+ *		    be returned.
+ * @output_rt_size: TrustZone expects caller should pass worst case size for
+ *		    the output_rt.
+ *
+ * Return: 0 on success and nonzero on failure.
+ *
+ * Upon successful return, output_rt will have the resource table and output_rt_size
+ * will have actual resource table size,
+ */
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size)
+{
+	struct resource_table empty_rsc = {};
+	size_t size = SZ_16K;
+	void *output_rt_tzm;
+	void *input_rt_tzm;
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	/*
+	 * TrustZone can not accept buffer as NULL value as argument Hence,
+	 * we need to pass a input buffer indicating that subsystem firmware
+	 * does not have resource table by filling resource table structure.
+	 */
+	if (!input_rt) {
+		input_rt = &empty_rsc;
+		input_rt_size = sizeof(empty_rsc);
+	}
+
+	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	if (!input_rt_tzm) {
+		ret = -ENOMEM;
+		goto disable_scm_bw;
+	}
+
+	memcpy(input_rt_tzm, input_rt, input_rt_size);
+
+	do {
+		output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+		if (!output_rt_tzm) {
+			ret = -ENOMEM;
+			goto free_input_rt;
+		}
+
+		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
+						   input_rt_size, output_rt_tzm,
+						   &size);
+		if (ret)
+			qcom_tzmem_free(output_rt_tzm);
+
+	} while (ret == -EOVERFLOW);
+
+	if (!ret) {
+		void *tbl_ptr;
+
+		tbl_ptr = kzalloc(size, GFP_KERNEL);
+		if (!tbl_ptr)
+			goto free_output_rt;
+
+		memcpy(tbl_ptr, output_rt_tzm, size);
+		*output_rt = tbl_ptr;
+		*output_rt_size = size;
+	}
+
+free_output_rt:
+	if (!ret)
+		qcom_tzmem_free(output_rt_tzm);
+
+free_input_rt:
+	qcom_tzmem_free(input_rt_tzm);
+
+disable_scm_bw:
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
+
 /**
  * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
  *				   and reset the remote processor
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..50d87c628d78 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index d6d83888bb75..7c331598ea15 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -88,6 +88,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size);
+
 

> 
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha
