Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C244DB57C;
	Thu,  3 Sep 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449299; cv=fail; b=Sxhi74L3+kEtQashjc8cBzO8djm7Jr/mAf0lUayBYjyACqfq6fTMjGnxwOZ5r1rCnAA6cdQCsjNy7SRMC2E1dUO0ziyaolMvb+eaYg3DEpjHL7rYHdBjiGfb+zqXLsHZHYKcx7PPdMeMZU0raIimyRxGWE2sc7acFDDjPEGgMbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449299; c=relaxed/simple;
	bh=DAEr7x6Sd8S71CZ2PRvVFCq1aJJn3FZMUtoiVij0WIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lkmuMH9Ae0EiEVFChpUNMnxJ9kwq2fDmfhCtlnhxHxUKa9CjA3NtYmRXZ5T0sxM/ACletWEABy6D8132h0+2ACAHRW1W4qjQEdpsNUIcwrURUuwmVuBGWGcqXUlNSv1JHw5RXOPpufvzs5eHAC3SiqpPkx5TNVOJ51aQ/AtnXy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ttCDdxHQ; arc=fail smtp.client-ip=40.93.194.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ttCDdxHQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZXv1bGBRu7DSmiaIOOhpc4NvplSSFFCq7XmqY3Wz0xKx5gkggReOpKzoCx8uD/Rwa7i3LM1U/at+BbLkagG6dTGgR11dm4nINdLZ5/rFZYZF5BlDYaqlLbccd1owcUk0FVRj2jTivRdQ9qNiBRjXSQuhmgzEP1BCqB/UdTpaNUUDMLtJ7TTdZGK5ewu98qu33Mp/CNm491SHlmmiWtCppwWFjmfliSOLq7aLN/RoomLqMQ3KCo6yYlRyHO2c5C6qslpse3M9fAKcbjRg4gZ8dX9+Y7KsaLI715xdYxsF2lFjL0SgsD72txBXoLlcOIoClXAzTavQtcSvF63+5FmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNmdBRiIBXqd62yl+gjkdtrSwY0R2ELG/xzMT4F1Rl4=;
 b=zR4FJEskXlZycl6fAP3v66inTFFoG/utg5hd7TzL3MZfXmS2Q7qx1GYKccc09Ma4OFyKlM9uiPb4Hu4ro/gGgeDbFds645jUWZlDwqrM3SINelwgoYw4LYBb4ZQp0JQY4aP65m7OU11Q8sUYRCViHV5GLHjgf5LSfh3TbmuAghDiVYM9nb1n+3dsjsUrOmxBchQT5L+bo01cx6tXFmynmSrUnUhrnjDKc2LvdMzjzF2gs4z2UNZ2n/QyX/B+etAoYWsrmESBmgaMaS6tWJLszMun/TcD2MwyjREUAP6k7qNJn1BoiCGvjZfUWYse8Qb8Eii8ohIL05prywT4aOuZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNmdBRiIBXqd62yl+gjkdtrSwY0R2ELG/xzMT4F1Rl4=;
 b=ttCDdxHQ88ttXvyYo7UuAvC7M16apv3sa4btsMiQW9b0ka8hOZBIBOyG31SyJdFAo9oO/f4LOm7bnipXqQmWAD+W7sqGvpWhm0NtC1f+Gmr2LQiiQqKJG118xSn1va8PPrD4KAtNVxALK4RGVZ/GDuf5Rr/B2CcL8S/PtP0Ri8c=
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:28:11 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::58) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:28:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 10:28:10 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 3 Sep 2026 10:28:10 -0500
Message-ID: <20f53e0f-4b9a-44fe-bb6a-ea0f988b64b9@amd.com>
Date: Thu, 3 Sep 2026 10:28:09 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v8 0/5] Enhance RPMsg buffer management
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Tanmay Shah
	<tanmay.shah@amd.com>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
 <4f8cc4b4-8c44-4d2d-befd-63911afe27a5@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <4f8cc4b4-8c44-4d2d-befd-63911afe27a5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d93cd95-9017-449e-adfc-08df09cff6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|22082099003|10067099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X9JVL7UGuYnq0SomKap1H5lJpQ5hqKr9OgoW920DXyNMFIuqz7ZdFdpHi/+7SjZ0gdBTMfobU1RQ4s4aNPOSeIjK8lhOT5aM+uHc3PKqk6Y5yNaesMbrlVvNnxC3wPq4ZNz5mr7kAfNj+OJ9hR8C/96eOatGNWyEGkJYWSIj9R1zQA9pYkplrMyqHQ/FEPMm6XeDne4LkON+jVo7p/RQ28x59vJ8m0SmXEAKnA6LAZtp2CA7gEzGkQkHzpJfLAdHs/6KqAowjQk2LxiW9Om6AkQMh/mYZJusLzkr9reqxeL6opaV7T1LYfxkvJAEz6r5nIAPoYMQzclVW0r66YlgOroiY1rlUOrR4Wupf7ZLCz8bwWICWav+P/x6SP6n5dpCwDz6ZEfYgFlciM+lsqJ0I32TKECzb2IB7T4dQvWgw24qaUqXpZCvmd65RbMnZp7bEgwJt52ODuz3OWsGg8rb++WcOeUfXKhSlxHyYDYU1h+35XfO+FW6ay34IzlLjtEKgDafuIB0GMjVOoGLQaaqA3hTi2S1Zr43tLV6/A4/XHLY4xUaB8MgIwwDdSC5TDPUAEMAQYxtDKrvnG8qdqCPWnDUiRIUieifDUfWbaBAehFEfuokpGPjcIog6KmKb410Xxk7Ogn+Qxr96W7RJY6co9Ysw0OFAr3SemKH8YCzqXOd8E3O0BIYwkIbb7pISxt8B690UuSc7+ZMUr5QTBeLsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uFl9DTcsL8sdEnEFWW6w0UPJHDtx0rMetU75UfWIjMNwXBIDXLwBgqnxh4QyvxBUFsEfzhwsS6dxBNwErwsjlJ2nWppT+6+feFocQLPlCjyOR0qXWTVCJcPHmO0mEouDHdmUuGowGWFGEmk76WrGsWiX8T/GDpqAYKjw+x9qkLIWIzN3aSRmV1ZH4prnUUF6EFKpoYLxHVMN9e+YO2ALq9yWUMxe4e8rbOaffa0xBoJtFYwPg2JwAGLZLvNyYlLmAL4U8gxZk9c8whmqc95pki7jRJ49WX4ugBQaHvDlTICAyUfMYEPp589u8LfetTBXaS5KzCz1gJ4N2STIZ2g7LGCEWK/Kkhidadh3Vl+qQwhFh1P91P5RY7lwgNf9ME5ya1z0S+Ov00HNzVB9F3+b49detbvTHJDvv84N40FSZ+ATRi/ixwu1kdajAMOydVc0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:28:11.1113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d93cd95-9017-449e-adfc-08df09cff6b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671



On 9/1/2026 8:03 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 8/28/26 16:58, Tanmay Shah wrote:
>> Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
>> tx directions. This design is not suitable if the payload is larger than
>> 512 bytes or the payload is very small and doesn't need that much
>> memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
>> size and rx buf size from the virtio config space in the resource table.
> 
> This version seems good to me, with or without my suggestion in patch 4/5
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> Thanks!
> 
> Arnaud
> 

Thank You Arnaud.

If I end up spinning another revision with any more comments, then I
will address suggestion in the patch 4/5 as well. If I get Mathieu's RB
for this series, then we can merge this series as it is.

Tanmay

>>
>> Changes in v8:
>>    - fix commit message of 3/5, "%s/enable/Enabled"
>>    - introduce new function to get buffer size for the vdev device
>>    - fix description of VIRTIO_RPMSG_F_BUFSZ define
>>    - "%s/or differnt RX and TX sizes)/or different RX and TX queue
>> sizes)/"
>>
>> Changes in v7:
>>    - Fix 5/5 commit text, and move change log out of commit text
>>
>> Changes in v6:
>>    - remove buffer alignment from config space
>>    - rpmsg.rst: modify alignment related documentation
>>
>> Changes in v5:
>>    - fix documentation about alignment of the buffer size
>>    - change version field from u16 to u8
>>    - remove buffer alignment check
>>    - Separate buffer alignment vs MTU of a single buffer
>>    - Use buffer alignment only to get next buffer address at alignment
>>      boundary
>>
>> Changes in v4:
>>    - Introduce new patch to modify rpmsg.rst documentation
>>    - check version is always 1.
>>    - check size field is same as size of struct virtio_rpmsg_config
>>    - introduce alignment field
>>    - check alignment field is power of 2
>>    - check tx and rx buf size is aligned with alignment passed in the
>>      structure
>>    - check msg size is < MTU size
>>
>> Changes in v3:
>>    - new patch [1/4] that renames variables with clear names.
>>    - %s/rbufs/rx_bufs/
>>    - %s/sbufs/tx_bufs/
>>    - %s/last_sbuf/last_tx_buf/
>>    - add num_rx_buf and num_tx_buf in the documentation
>>    - change version field from u16 to u8
>>    - introduce size field in the rpmsg_virtio_config structure
>>    - check version field is set to any non-zero value.
>>    - check size field is not 0.
>>    - Remove field for private config, as not needed for now.
>>    - add documentation of rpmsg_virtio_config structure
>>    - Check for error when retrieving MTU size in the sample driver
>>    - %s/mtu/MTU/
>>
>> Changes in v2:
>>    - Change author
>>    - fix commit message with better explanation
>>    - %s/sbuf/tx_buf
>>    - %s/rbuf/rx_buf
>>    - %s/num_rbuf/num_rx_buf/
>>    - %s/num_sbuf/num_tx_buf/
>>    - %s/sbuf_size/tx_buf_size/
>>    - %s/rbuf_size/rx_buf_size/
>>    - fix typo
>>    - do not use ALIGN on buf size, rely on allocator
>>    - make err msg more explicit, %s/vdev config:/bad vdev config/
>>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>    - use __virtio32 over __u32
>>    - add version field to virtio rpmsg config structure
>>    - Introduce new patch to print rpmsg mtu size in the sample rpmsg
>> driver
>>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>
>>
>> Tanmay Shah (5):
>>    rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
>>    rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
>>    rpmsg: virtio_rpmsg_bus: get buffer size from config space
>>    docs: rpmsg: add virtio config space details
>>    samples: rpmsg: add MTU size info
>>
>>   Documentation/staging/rpmsg.rst     |  17 +++
>>   drivers/rpmsg/virtio_rpmsg_bus.c    | 156 +++++++++++++++++++---------
>>   include/linux/rpmsg/virtio_rpmsg.h  |  41 ++++++++
>>   samples/rpmsg/rpmsg_client_sample.c |  20 +++-
>>   4 files changed, 186 insertions(+), 48 deletions(-)
>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>
>>
>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> 

