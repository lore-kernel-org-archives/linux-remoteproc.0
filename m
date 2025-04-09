Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B019D080;
	Wed,  9 Apr 2025 05:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744177070; cv=fail; b=uHXJL7kfNTz8xIGRoqk+A3GbmXzxHn+7rZiHqK42t0jQv+QbgElRZM6nglK92HRFzTrZvnROCKYEN3dfHw/aCN8BNsNF1IjgRGNvra8vY9SOzsGL9SMe4OOZTL13L2f2eu9IlHyWErpCm2mBLeajAg8CjmN7zHAolhVtH76CWk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744177070; c=relaxed/simple;
	bh=s3w7WOB0CuEN1w/mwj6PhJfPcs1I7oYIAe7KLroDFzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tXzrnZdnJoK5apwaeLh9w3kiS3MgHK0SL9QqxWm4AVAsTgW1gBsUpyik2Jkgqh1fPX0GorgNdnRAMIM9M+rp6vfPxuiCiSNn6k1dsIo1JiINxYtFgy19R8so8MdU59ZacVDvcwA2Nx/yI9hb+F4QR8YKJBFQDi5wZcvzpED6T2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AO2C4zBP; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AO2C4zBP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBpF3NUAb6j0cTmh+Do7zW7Y6cgHWMMb8E5lqpb7cbUX4SHuXp1umhcVAv0n++UPGbGjk7QMn9a9mcCnYq6rZbBGXKVCYqjvlorbn12Z1z29gxxuleXBVXW76sErkjaq8ZGWyYyGpl/tC3siGs0skZ5P/FKqzCvaPM2Oa15j1NMNi/+2uCw5kDIU/vjAcRLFgGeFWAfwS10RFC9imtzO0oh642lYKCGb4pzsfs8UK68XdRUFnEU0/58qlzlNXTeM92SrwopEd3jle7EPfYN118+xXFhfHV59Gq5NxcRxfXHrKdwoTn1ZwWoXeUwsXmZdWW6b5g+L2PD3zAwOhyFlWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wueWX21SRRvnr8zy/8X1gg7zef/ut5gbyCo4s40nduU=;
 b=K/ueDHJ8r2r5Z1wcRio6nxiAGWtCCYsLcGuCrfQ4rk2O6KKcaYFJNsK3r12aN1Pt7jNXXtnbazs+iXsP9omcUwwAGcfw6mg6a++zp6OFYn/bMrQgGIomjYz0Z+S3q5Yp0DNjTpy9IXynCNETlHDXyjI0zM43rk147tz9208uLB1TzVxynco3uyQVtVLpRDzKndVu4hxiE2KMAK0Rp/NYcY4iSdmfgy88tm5DXcBwCjNh0gzVbKn1sFiGCISFztv0AF7O6gqbtsVgJi/byalg0sRElZPpdl0+Lzo0ZiqN+0yE/iE8eVin7KigB97TyUGA3WD4qQkUBCuM7+L07EC3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wueWX21SRRvnr8zy/8X1gg7zef/ut5gbyCo4s40nduU=;
 b=AO2C4zBPzJd23xG/oNwUNNdrEoVF9xIeWI4WJiBvzgdWLS8Jax/0e10hVpc+h0l/dhRgNeb6Nsedxw2VTLbxdEGqZdI5WwKoBKfGVed5zMlecly++mo4Rlq2VV2kE7lPErNbI/hvw4gwRh/ixXbJQvADQ5duIjlt5Mj2J/a2n0s8Ltv3pAo2MjfKcDgfZpTgh/dMU42+fOE0gMv0S0xVX0dcdNejWq8AdzS+QPVPNEgB6OQcA7Ql+OdjRV8UJmax4yOuNEvoYBpX+tVQVsnL/lDgsuEDH6lWrG4qK71DIFmRRKOdr3vH+0zb5Vd05LhjM46u/IT6SkWdYwPL2oBD/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 05:37:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 05:37:42 +0000
Date: Wed, 9 Apr 2025 14:46:10 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250409064610.GD27988@nxa18884-linux>
References: <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s>
 <20250402014355.GA22575@nxa18884-linux>
 <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
 <20250403143239.GA22779@nxa18884-linux>
 <20250408161054.GC31497@nxa18884-linux>
 <CANLsYkyEhhQA5KOsNveGSHUc3ZpckoL-CCHNZ0DZLMNYdNGzdQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkyEhhQA5KOsNveGSHUc3ZpckoL-CCHNZ0DZLMNYdNGzdQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0111.apcprd02.prod.outlook.com
 (2603:1096:4:92::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e51ba4-22f5-4545-35af-08dd7728a555
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1UI3/9d3wirFzIzvbsdhGii67AwymQiAZt1cJpYAsnbtuTnokGvH6MI1jRSA?=
 =?us-ascii?Q?brwQeou3CYVReG79G3NZ+lykA/R2eI24YGdhQyZgt++5TgPD59gz3nolBMEN?=
 =?us-ascii?Q?f0h0O9cr0+bNwsJ9nJj71U6IfruX4BL4kxJyjexABTx6vNfaNtONtLQ8H7CE?=
 =?us-ascii?Q?kRgW5e14L64lKF+8bIJ1ZFGwW0dEFw7QFLG1aEkdOtDKiLdDpQ9i5CNoaE2t?=
 =?us-ascii?Q?BEghhG9nNTbeQgIovxBRsup8F41G+k04NZhQcPR4vZE2GBSuPzMDZa4Irzyc?=
 =?us-ascii?Q?NGVj0FIIvptjEX9JJwiqcc/frENEdKs+p0MufHz64jP3kjWTc4BaJsnpq4at?=
 =?us-ascii?Q?r6MZMNDTSr8V6REHxC2juNT3JLCmRVkyjIPycMczcUbc14MuxejKzo9qn86I?=
 =?us-ascii?Q?CaHasf/wZUBk6IgyVylvfN2lcNQx/djkCTDxOb9vyCyjVS3/z3hmc3i7o2NN?=
 =?us-ascii?Q?gAaKRPHbQ0fcRyeLbEupEdOhuIap586D11KO7MwAMfp1oyE5nyD0/HLeQ7Ha?=
 =?us-ascii?Q?7+kfYzLdTOSv+Dzk99p9mWrFvY6X+57ujqZ6pteXGhR0OjToPWvfNpnbc39z?=
 =?us-ascii?Q?sIviAjq0p72g0ch1SHqPRdHrBRikej1Q9U6PZSOsrFrmSILDt3CTrhOW6VOE?=
 =?us-ascii?Q?t74+bnOYn8VrUKFf+6pmDUj7aP96/RmEd/Y0UV0sLenuAA4oPYhnWmO7HQNg?=
 =?us-ascii?Q?mcED+04gkc+lwnpyGUv9gIbSYrItIGKwQTgY6jgUcS+gStvg+kEJlzKTLsJF?=
 =?us-ascii?Q?uLcvlbXIAEnG5fxzfIF7wtwileKbh+KpfkfhtX8uZXjEMmzENablp764Yqgy?=
 =?us-ascii?Q?Oqk+kXl/vRhsZ2clc/8Oh704gDK35gk+RVYa0CB5TIeYdAToxi8IVhwapM0o?=
 =?us-ascii?Q?6SQwBn79elubb2P3/1IG6CFsDYw3AneCHmIIq3BEIj9XjW/eZSDTvaBikGQ4?=
 =?us-ascii?Q?4FeOTDYEwN4F2/Y1CN/m/oLAuzhR/b5hGX/rhR5BLyViRI0NPtopB5V0hhnz?=
 =?us-ascii?Q?8N4cHIGHGoGc4nlEJ5nULcTmavRXa0qSlMC+NRZPWHXf0zfelBYQBhyJ1ES5?=
 =?us-ascii?Q?UlXkDuMRJAH4mgFjs8MojJ+d1fEe/10EIs+DUg71U/XtTFEsdD52eOqBqorI?=
 =?us-ascii?Q?P2hBmQtw5iz5Yr6Ct62Y74+tnDYK5IcgOaX455KSNtdXTFuRlZLt+Kkl7a4L?=
 =?us-ascii?Q?C4Ys8uBGNVkkACGq8oY5H3O1tkdD61zywInMgpTGvNXduXJ+1qUibEmWdlqx?=
 =?us-ascii?Q?1z4kpp9fffSL0DL0RQ7HAb56Xnese+ERhQ90zzw6h5eGXeLyFDl3it+hUxmX?=
 =?us-ascii?Q?9qvjldp+PyPxbpXlmcMHoF4kaRWg15okM37oNP24Nf5aKwHu2bxogTfYKMWp?=
 =?us-ascii?Q?vjb3nBeSVg2CHuZbo5+XUPj6EjIFMyXgkc+2QcyRYF/NfPhNWC2xcCajyFb4?=
 =?us-ascii?Q?KPhUmQth/pwb/XNZwSUWcXbctHoTd67VXNb5cdLZc29woWgB9XKmdJ6cJcq2?=
 =?us-ascii?Q?Iz1NCHESL9EonGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OVRlFojAw0ITSPNan4//EgB5X9tb5DHVYUNNxzqXMSqHrK5TDWmJlW117muJ?=
 =?us-ascii?Q?T3H5MmL+2vQDe/ifwT1pFR1w1jFv7LIoUrD+qYRuMBg68LOAsQ/uGUsZx3Bg?=
 =?us-ascii?Q?JFdI2k/5IFjwIhfy4hN2mTCzR6etu40DE63S6r/mZoIwD87PRfzauZWm8N6l?=
 =?us-ascii?Q?dtUfIvlm3zmeHM+VSjl/0pqE0oFwzMjp0zAVxrda+dXcqn0CKfRqi5k18j7o?=
 =?us-ascii?Q?RaQtILN3Nsf/F+xu9fvsw6192wCOwg12N3pMokVv+gRcnSS8XdCufCZx0I7h?=
 =?us-ascii?Q?Xw7O2h421vHIIWs5OljsjH3nwKGLflwm7lt6YYk1w4WPbCwr/mwItbiZi3b6?=
 =?us-ascii?Q?MPS3mjqE1Q0tHhySV0qyCgv0tsYDRKM8F1iq5zqbniSwMojZICOUqL4mpK3I?=
 =?us-ascii?Q?AgHyTb2t/rbzOQPTqiNqFFbSMSQIPQHyXwICujmFNv996kNpzNaBfoAwADTD?=
 =?us-ascii?Q?uh2qOh/qDJ5eVqGeuQM9Jipxu6NqkzF1LgvwMBjQ1D4rKjP1hIKBrpWNEl/A?=
 =?us-ascii?Q?mEqv9YD8olERPz/YTiSTKp/ouqQmnW0OhAs02Z8iCtCSRWzvJnQVnKnbNFqM?=
 =?us-ascii?Q?jIrLY/ErXiP6Yc0IZpTIy02OJFJ6S0YS+6e+koCJV+ct6FxYBqljiVqhb7XX?=
 =?us-ascii?Q?ZeefsbIZlGNFq4EEfuZdYopwfaNSDGz7yIWO1gMtAKXNnxZLD1+3yVA2wJoq?=
 =?us-ascii?Q?Z5nHg0yiJUoeIYdF4/ZtBHEyUHOUNUCBDZ/p0GrwxCw6r1QnMow9CsUJ35sN?=
 =?us-ascii?Q?qhASOTFC+1ORHZw8IrrV3D+ODZOuOsOcaKE1D0aNan/pf4Up2Dl55qCVv0+A?=
 =?us-ascii?Q?xUy8JQnGmNMMGBbz44rk6YathzkzV3pRxKw6EHhiCvAmaD7/dOhXwmjiXN8K?=
 =?us-ascii?Q?yWEbkdDuTs82ZhJQaz5lmx37oNimsxYuRy197zzzUfctXSu3kqZxMh7Vzc2T?=
 =?us-ascii?Q?RH/q3qoYaEGYneimQSy7FaZC+w/C3TD04CdSu3h/BEHntC4N9gmPiTYqSQ23?=
 =?us-ascii?Q?G7dn0OmgFbQ+W7QcmqbuR4GoZUoczgGI75Y46Yc2jdc7ovuAvHMeLqeFrtuD?=
 =?us-ascii?Q?8IT5Bucrs4k1ocHYwQ7Qhi/S1K67GLdrvfnvz0oNLWKo4UZJrYHvZ/hq6KQL?=
 =?us-ascii?Q?EXDmEkkU7u0JiAZ+17VGiRcNCXov66GO9kHkMX29ZI0m3NPwPxdw5yvAc4q8?=
 =?us-ascii?Q?D6ohrdVzRKyti/GE8jdrv6vl50COi0RE18MNXA3TSkjGdX+vyJ+zb4dr0Ufg?=
 =?us-ascii?Q?1dplSn87VIfAAjOtUM0XiFN3LsEig5xLW2Jb8Uze4VBvLs4mNOqRgOuHYwo7?=
 =?us-ascii?Q?MSCyNX73YQvVBoPWgnKohvntglGbowsQH4KoaVNNEuvRkLfqW1t0neo5EeoT?=
 =?us-ascii?Q?p2RWBiCh4aPQlQhjFzTz9BV5K86TyJaqcu3v4fXvWs4jUeQT4GnOzWfPFgWo?=
 =?us-ascii?Q?KpEs1+BezlHzzhQv/IG5plVzfwwlQvW+fTuqydlfyc4UrjPpIS1F42NB0+4N?=
 =?us-ascii?Q?0okoL4QY1/nkRLH/9gxiFi22szMkegEE/NqvrBfvoABNXDPVHzeAzeLxB5UO?=
 =?us-ascii?Q?m0i1jdBB6K8WUEDMvx0IMmszIoEZYHw+rD7vfzK3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e51ba4-22f5-4545-35af-08dd7728a555
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:37:42.3844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5Y8QInx35S73C++VV1M0GmD13PRim+Y+YNaERxrFMt3fJ0C3CDkeBgOS3mD129Tiqc+oel36Jo3zDNINnhffg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758

On Tue, Apr 08, 2025 at 10:59:58AM -0600, Mathieu Poirier wrote:
>On Tue, 8 Apr 2025 at 09:02, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>
>> On Thu, Apr 03, 2025 at 10:32:39PM +0800, Peng Fan wrote:
>> >Hi Bjorn,
>> >
>> >
>> >Thanks for replying this thread.
>> >
>> >On Wed, Apr 02, 2025 at 08:48:58AM -0500, Bjorn Andersson wrote:
>> >>On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
>> >>> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
>> >>> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
>> >>...
>> >>> >
>> >>> >The core is already checking if @loaded_table is valid in rproc_start(), why
>> >>> >can't that be used instead of adding yet another check?
>> >>>
>> >>> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
>> >>> could benifit others in case other platforms meet similar issue in future.
>> >>>
>> >>
>> >>I like the general idea of keeping things clean and avoid leaving stale
>> >>data behind.
>> >>
>> >>But clearing table_sz during stop in order to hide the fact that the
>> >>future table_ptr will contain valid data that shouldn't be used, that's
>> >>just a bug waiting to show up again in the future.
>> >
>> >Agree.
>> >
>> >Do you need me to post a fix for
>> >commit efdde3d73ab25ce("remoteproc: core: Clear table_sz when rproc_shutdown")
>> >by clearing table_sz in rproc_fw_boot and rproc_detach as did in this v2?
>> >
>> >To i.MX, the above in-tree patch is ok, so all it fine, and this v2 patch
>> >could be dropped.
>> >
>> >But anyway, if you prefer a follow up fix, please let me know, I
>> >could post a patch.
>>
>> Hi Bjorn, Mathieu,
>>
>>  I will wait for one more week to see if any concerns or questions.
>>  Please raise if you have.
>>
>
>I am working with Bjorn to get your patch reverted.  Once that has
>happened you can send another patch.

ok, I am fine with this.

when get reverted, I need use another method to fix the issue.

I posted two approaches[1], but not get you reply. Since Bjorn raised
his concern on 1st approach, I think I need to use the 2nd approach without
touching the core code.
pasted here,
"The 2nd approach is to clear rproc->table_sz and rproc->table_ptr in
imx_rproc_parse_fw before rproc_elf_load_rsc_table.
"

Or a V3 of current patch with updated commit log.

Please suggest.

If you still have concern or things still not clear to you, please
let me know.

[1] https://lore.kernel.org/all/20250402014355.GA22575@nxa18884-linux/

Regards,
Peng

>
>>  If no, I suppose this thread is done and I will start my other work
>>  regarding rproc.
>>
>> Thanks,
>> Peng
>>
>> >
>> >Thanks,
>> >Peng
>> >
>> >>
>> >>Regards,
>> >>Bjorn
>> >>
>> >
>
