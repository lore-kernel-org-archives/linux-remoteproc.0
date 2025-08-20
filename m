Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FA2E62DD
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692683; cv=none; b=N8W3LO/PbebNJhcZ0sAY29qgMRMMk8h2tMLrbvCwJoAx44xqqJd2apPHyCzobw3yROXgvg3KbPW2cQMa5+dSKClmFPWo1TTzKn60KlsTQ0g/T4BgcAjg2yn1R/oJl2EEAhw3kRzT8Tlb1mgagmTkFKVRYTcxhIl0dkgeR2N0eMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692683; c=relaxed/simple;
	bh=MomZXsFaLDbT6+TmHvvmHexTKkxB4YMU4SO/vDjzvxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRH7LIB6l+PYKajgUI9F1h3h2o4W8K36wt/f/s7lzvwGSUOavBZsAXP/v16NzS07ZPFdvDD/tkv8GD8bAGMlJKneKMBMN7D0I1zkxTaick6he5jX9T5LE2tbBBlQdZiScTJousWLRE+0INuCsnyldT6ORRwl56NL/lbvhh4J+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEHUQiPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEHUQiPK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA0LXP001990
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td0CaUx2Mv5Qw5Lyu7yhTrBx9hRRCjajUjhMqPsrw5c=; b=OEHUQiPKZshci3wo
	ZOR33yd7Kwz53t4GeEpOB6cmS3TiQlnZoipvDV+5leJw1O9ufMzTlOD9CHu0ePfe
	MuxftA4S10jrtSKzbxtM1hPwxLS3mGh/MwHrdqyFQ4noLOxhsbo5+LOfDfIev/7U
	PU/aMDAL7dZYLtX0P18tJvzLZjp78P4g1fvXnW40NSoXj1eJPRK0jK+VD17n2QG7
	R2kiHtLnJguVFoq1pUkqaG1jLfHqn9fVgdpRB7nkruW+yPhc+cRSZC3h+BYplf1O
	sO0irGsZxwrcctHKRUL9pWJz7dnHDHmMrsUbTP+C/2TfiUGYNhYPN8k4d1Go+kR8
	IWQOdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528smuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 12:24:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3235e45b815so3942714a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 05:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692677; x=1756297477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td0CaUx2Mv5Qw5Lyu7yhTrBx9hRRCjajUjhMqPsrw5c=;
        b=PMKI+7g9ZviOu+kR7v+IMXcumwxSn0SON+tNBtXR4JfStQ45NIVqrqUFOgEjK+c94c
         7zgxeBLKtVknOvUzkNkWJspZFb3b+ACikOSODi8KHYh60yPL9RCONTPUtlNRH+ofVD64
         w018sYpb4eyLvYSNZgLu10fvUWGkLSY1iuDtRbGObAG4bDy2WAZIw1aBpj0m2lBTtWpT
         ALqO3urQupF43SUsi4kvTSODhlBCaOWWZZyTw8tgxt0Pd+6YaFkjhWwORwaGvT/Lawjn
         CiuAPuhDqUXgA7UIg6dl+fCb9RPiPcULK9ruavO7LWRdNNTlR1H7YgxJvqbMfcBUXaQU
         U0dw==
X-Forwarded-Encrypted: i=1; AJvYcCXg5SQlTj6zyNJvizAYryn4gVBBfU4TTWLKguOaFFLWtES9N/sHrxRLpBc0E0eqjHa0x0MJyM/RlFm61DhfLAzx@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQqnt85YxgTUFtAh6NKWpbhegviA2GHFGwBCYW9taHFcnJ9RP
	Xmx/hVPhquJvpbl9snEV+OpLOu1WxmejeEYfjf58f5Gw2b8t9a2JziFiYaeP5gSOOh1lrFHHJSJ
	7TszF5xJzok2ck2XQpW5U/OVIbmTGiT6DcNd90VVgjpi9w3lqx7ehnp19RwPgJWwWFqF+f9l6
X-Gm-Gg: ASbGnctak+ptJ5XDPMGXKft5N3VN0oRLq9Bm4KiAkxHPl6GUUROVheGoaoQTufBgcja
	EBpuNXkbRzdIXIQFwlMKB+gw6n1Wevpjv70Flwi9TmxnvUhBOCS9zYSEaZEhAIUgCxDhnxcAfy6
	ABHpYFMp4/BzUVV4AXwIbQIGlieLRIMJmGA38SQs+AiMAGJXE6u9P1u2w0lPQezCYzu3azQnjrr
	+3tum5dqF820Er+PkWN6hoV//eGejq7mFooYLhO/SxxJptwoW8mNUvMWWX5p+33VkpTRy7i6qFT
	QngkeKUKEHLhN5J8H631Ptfl43MFQ5phyoLyqaYT+hQgx6nYB0U/i9lbVbhWmGh0ovU=
X-Received: by 2002:a17:90b:53c4:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-324e136d137mr3422805a91.1.1755692677115;
        Wed, 20 Aug 2025 05:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSeDqZ1+f+FBiw8LkrIwhczOd3iHu1k+3zFS6lbDUoID7JiwtZhB6MFHXNPH6K7kLVr/h7Iw==
X-Received: by 2002:a17:90b:53c4:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-324e136d137mr3422777a91.1.1755692676600;
        Wed, 20 Aug 2025 05:24:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640909f6sm2201034a12.35.2025.08.20.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:24:36 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:54:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 03/11] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <20250820122430.pasbypbrtbaynxv7@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-4-mukesh.ojha@oss.qualcomm.com>
 <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5be86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o3WOxAlSagPtyj5-6KUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HGEhYUwujr5Jzm7149y8Q8pi-cORZeRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4ihGYIujO50C
 MHOhNGJWV08GoFkILwmtJHHZ7pzsHVexsjZqZDPjhAglhjUvpgaYcqjRIEvkC4yGlvMBCdHjplg
 90T2lmjvUhECM85PhkoKklhyVR+X0eI0mKWcKOFPKezNBqquVdjPk9LR8BLg9KdZBC6Lf8j5109
 CGkk6FbrK7GNQgL8bHCj0a9qJkpRK61nGdeb2GMPE+GZLBXtzAAxPEKoPpnFMCfKyhTEmyfm0lE
 kAPkwp0soRSiaFtMkrgxLpTiU2PS2ycdDDPH5KhCrTMqyMQTqDK4ax0NvgvhmhBWpfcBbmzKKiP
 PGYME3NePcnVtAoDgspF7v8985W/uyNtoAVoj7Zut6g4W934q9bm8y3GolxWhzDJ8w2Pb7dPyjU
 By8LQCm9huzy1ByF//2l2RTuLHDKCQ==
X-Proofpoint-ORIG-GUID: HGEhYUwujr5Jzm7149y8Q8pi-cORZeRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 01:03:41PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> > Environment—a library present in the Gunyah hypervisor) utilize the
> > Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
> > securely authenticate and reset remote processors via a sequence of SMC
> > calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> > qcom_scm_pas_auth_and_reset().
> > 
> > For memory passed to Qualcomm TrustZone, it must either be part of a
> > pool registered with TZ or be directly registered via SHMbridge SMC
> > calls.
> > 
> > When QHEE is present, PAS SMC calls from Linux running at EL1 are
> > trapped by QHEE (running at EL2), which then creates or retrieves memory
> > from the SHMbridge for both metadata and remoteproc carveout memory
> > before passing them to TZ. However, when the SoC runs with a
> > non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> > metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> > for remoteproc memory (before the call is made to TZ in
> > qcom_scm_pas_auth_and_reset()).
> > 
> > For auth_and_reset() call, first it need to register remoteproc carveout
> > memory with TZ via SHMbridge SMC call and then it can trigger
> > auth_and_reset SMC call and once the call returns, remoteproc carveout
> > memory can be deregisterd with TZ.
> > 
> > Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
> > the SHMbridge over carveout memory and call auth_and_reset SMC call.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h |  2 ++
> >   2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 33187d4f4aef..9a5b34f5bacb 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -759,6 +759,52 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> > +/**
> > + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It is typically used when Linux is in control setting up the IOMMU hardware
> 
> Is there a non-typical case ?

In non-typical case is when system runs with Gunyah which in control of
IOMMU and create shmbridge before it passes the call to TrustZone.

> 
> "This function is used"

Ack.

> > + * for remote subsystem during secure firmware loading processes. The preparation
> > + * step sets up shmbridge over the firmware memory before TrustZone access the
> 
> shmbridge -> "a shmbridge"
> "access" -> "accesses"

Ack.

> 
> > + * firmware memory region for authentication. The authentication step verifies
> > + * the integrity and authenticity of the firmware or configuration using secure
> > + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> > + * sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
> > +{
> > +	u64 handle;
> > +	int ret;
> > +
> > +	if (!ctx->has_iommu)
> > +		return qcom_scm_pas_auth_and_reset(ctx->peripheral);
> > +
> > +	/*
> > +	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
> > +	 * shmbridge on subsystem memory region before it passes the call to TrustZone
> > +	 * to authenticate it while when Linux runs at EL2, it needs to create shmbridge
> > +	 * before this call goes to TrustZone.
> > +	 */
> 
> If Linux is running at EL1, Gunyah running at EL2 traps the auth_and_reset
> call, creates a shmbridge in "subsystem memory ? bod: which subsystem do you
> mean here"

Subsystem memory => remote processor carve out memory

> and then passes the call to TrustZone. If Linux is running at EL2
> then Linux needs to create the shmbridge before calling into TrustZone.
> 
> > +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> > +	if (ret) {
> > +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> > +			ret, ctx->peripheral);
> > +		return ret;
> > +	}
> > +
> > +	ret = qcom_scm_pas_auth_and_reset(ctx->peripheral);
> > +	qcom_tzmem_shm_bridge_delete(handle);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
> > +
> >   /**
> >    * qcom_scm_pas_shutdown() - Shut down the remote processor
> >    * @peripheral: peripheral id
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index b7eb206561a9..a31006fe49a9 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -79,6 +79,7 @@ struct qcom_scm_pas_ctx {
> >   	size_t mem_size;
> >   	struct qcom_scm_pas_metadata *metadata;
> >   	bool save_mdt_ctx;
> > +	bool has_iommu;
> >   };
> >   void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > @@ -87,6 +88,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx);
> >   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> >   int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
> >   int qcom_scm_pas_auth_and_reset(u32 peripheral);
> >   int qcom_scm_pas_shutdown(u32 peripheral);
> >   bool qcom_scm_pas_supported(u32 peripheral);
> 

-- 
-Mukesh Ojha
