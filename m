Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625353A7;
	Fri, 10 Oct 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101287; cv=none; b=T7h4YHgSANFs1e8/iylrPKusq7jSpagWfZ2/4FYJB5PZxv4RW1K/1CqYKcywp9sOypYhiY7qaAlvVtw7ijSyiTuk+H1D1SJCy4jl/q/GlV2OPx0oOQXr/bBeQ43UP/1xmfz/q9b55ZfAxGvuk2b1LwzaJiMLzpcH/tKqi3yO/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101287; c=relaxed/simple;
	bh=DIMc28Re/uWBE9UbF6RYAhvk+QLad4Iqz9POVkoClQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CGbkNzglGMqlCY7FVx3cg+ROI62sA+1m1W1wCwhpnmU79xlXoW2hqVg0RSkvqvGK/9gMA/eODt2VllVrpIZPH2sfiWCkWPcPEBvrEMDv4F33v2AXm3gniZFBV0g1nSr3aydkTgF+IBfEFAf4KVQpiLBdAziZfVKHlCOu9ZY8U98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OQ1URU30; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OQ1URU30"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AD1BEa691602;
	Fri, 10 Oct 2025 08:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760101271;
	bh=7MQUoAZ0HNpxVkNgHkiEnbeP1gMkIhO6PW+nJAFGI+s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OQ1URU305fv0IYaMaltsYCQMCVZseaMBcDaOFSoyrV46sElRuw2cR4NCeOWNgpl8n
	 36bWgpwu+6wrWakhMIknbmA0YWy5kivdPBKND75CarbAqaBgGLo2O8czB/YBOW3TIA
	 9XoYt7G1hnyEsYzQabnIWNQZ/OoOIgTexcao6Xtc=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AD1BUl2210432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 08:01:11 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 08:01:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 08:01:11 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AD1A9a1673948;
	Fri, 10 Oct 2025 08:01:10 -0500
Message-ID: <9c8d708f-bf20-4dda-abf8-7896c820c611@ti.com>
Date: Fri, 10 Oct 2025 08:01:10 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: core: Consolidate bool flags into 1-bit
 bitfields
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
 <20251005-remoteproc-cleanup-v1-6-09a9fdea0063@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-6-09a9fdea0063@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/5/25 9:14 AM, Peng Fan wrote:
> Per Documentation/process/coding-style.rst rule 17 regarding the use of
> bool types:
> If a structure has many true/false values, consider consolidating them into
> a bitfield with 1-bit members, or using an appropriate fixed-width type
> such as u8.
> 
> This commit replaces multiple bool members in struct rproc with 1-bit
> bitfields and groups them together. This change reduces the overall size of
> struct rproc from 0x4d8 to 0x4c8 on ARM64.
> 

Most of the series looks good, but this patch I'm not a fan. This isn't
a huge savings and bitfields come with many of their own challenges.

> No functional changes.

If the structure's size changed then that is a functional change. There
also is probably a performance change from extracting the value out of the
bitfield, where before they might have each been an aligned width variable
that could be tested in a single cycle.

Andrew

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   include/linux/remoteproc.h | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2a4e80ccafbe632436c4dfb636a1e..d8468a96edfbd82f4011881c10f59bf7c12e9c1a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -528,21 +528,21 @@ enum rproc_features {
>    * @index: index of this rproc device
>    * @crash_handler: workqueue for handling a crash
>    * @crash_cnt: crash counter
> - * @recovery_disabled: flag that state if recovery was disabled
>    * @max_notifyid: largest allocated notify id.
>    * @table_ptr: pointer to the resource table in effect
>    * @clean_table: copy of the resource table without modifications.  Used
>    *		 when a remote processor is attached or detached from the core
>    * @cached_table: copy of the resource table
>    * @table_sz: size of @cached_table
> - * @has_iommu: flag to indicate if remote processor is behind an MMU
> - * @auto_boot: flag to indicate if remote processor should be auto-started
> - * @sysfs_read_only: flag to make remoteproc sysfs files read only
>    * @dump_segments: list of segments in the firmware
>    * @nb_vdev: number of vdev currently handled by rproc
>    * @elf_class: firmware ELF class
>    * @elf_machine: firmware ELF machine
>    * @cdev: character device of the rproc
> + * @recovery_disabled: flag that state if recovery was disabled
> + * @has_iommu: flag to indicate if remote processor is behind an MMU
> + * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @sysfs_read_only: flag to make remoteproc sysfs files read only
>    * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>    * @features: indicate remoteproc features
>    */
> @@ -570,21 +570,21 @@ struct rproc {
>   	int index;
>   	struct work_struct crash_handler;
>   	unsigned int crash_cnt;
> -	bool recovery_disabled;
>   	int max_notifyid;
>   	struct resource_table *table_ptr;
>   	struct resource_table *clean_table;
>   	struct resource_table *cached_table;
>   	size_t table_sz;
> -	bool has_iommu;
> -	bool auto_boot;
> -	bool sysfs_read_only;
>   	struct list_head dump_segments;
>   	int nb_vdev;
>   	u8 elf_class;
>   	u16 elf_machine;
>   	struct cdev cdev;
> -	bool cdev_put_on_release;
> +	bool recovery_disabled :1;
> +	bool has_iommu :1;
> +	bool auto_boot :1;
> +	bool sysfs_read_only :1;
> +	bool cdev_put_on_release :1;
>   	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
>   };
>   
> 

