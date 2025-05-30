Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A51DA5F;
	Fri, 30 May 2025 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598362; cv=none; b=bsm2wedy/nlBbRZUZVcxym9jf8FZ5TjwR5WL0prkUelTH6LyIioRqLbokX5MoyiVQyDcXKfwGm80eoPhrlR435L7hm9u4uJhq7Tcf94sm/2NO2wD9EqbPcoP1I429N3GpKek5JGhmndLurMSvxmgyCcPGRpojJuojIki2SyQKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598362; c=relaxed/simple;
	bh=NLRCiIN5IbcBPzR6AKoY5aN2dWKPrEqtbIk0FkVvJoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BsUm/GGgRIqPR+6lqEPVPwPakV4Uz4eGDLmvO08nNgDQAU75A93d8pOLUqbOUBwL02INkyGKalgJzNqoSkMYHwIbg+vW9Q9oD/WAPZTDxhfVGt+pRTwUPCQD/OK8z2/w5OY8GKE+cLELRMgTzDukTOuqR61OCOtK8cZOcE42oIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KxD7v9cb; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KxD7v9cb"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U9jVIZ3754128;
	Fri, 30 May 2025 04:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748598331;
	bh=drHOb8GqnSqwcePNWyNck3XqQQY6k98cOLP6xg6zbmM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KxD7v9cborC2a02gEUqHxK5p5zl+fyWru2r1g1Lcn5LnCWQVgel8WKOCxkofT957o
	 A2gh2uNZJ3wkUlJZPEeDCSqkjQ4RS+7fsPKyVCSfIIYtSFybSV6yWW3kK4zq4/HBgP
	 zDRs1Ldkf273xDMMSqarQMc6oc1w6MZzIhUYjRZg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U9jVWw738175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 04:45:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 04:45:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 04:45:31 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U9jSSF2879750;
	Fri, 30 May 2025 04:45:29 -0500
Message-ID: <7e983702-6662-465d-86ac-d515849d731d@ti.com>
Date: Fri, 30 May 2025 15:15:28 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL
 uAPI
To: Dawei Li <dawei.li@linux.dev>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <set_pte_at@outlook.com>
References: <20250519150823.62350-1-dawei.li@linux.dev>
 <20250519150823.62350-4-dawei.li@linux.dev>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250519150823.62350-4-dawei.li@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Dawei,

On 19/05/25 20:38, Dawei Li wrote:
> Implement RPMSG_CREATE_EPT_FD_IOCTL, new uAPI for rpmsg ctrl, which
> shares most of operations of RPMSG_CREATE_EPT_IOCTL except that it
> returns fd representing eptdev to userspace directly.
>
> Possible calling procedures for userspace are:
> - fd = open("/dev/rpmsg_ctrlX")
> - ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &info);
> - fd_ep = info.fd


We are returning a new fd to userspace from inside an IOCTL itself. Is this a
standard way of doing things in Kernel space? (see below related comment)

> - operations on fd_ep(write, read, poll ioctl)
> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> - close(fd_ep)


Can we rely on the userspace to close() the fd_ep? (if not done, could be a
memory leak..).. Opposed to fd, which we can rely on the userspace to
close() since they initiated the open() call. I am just trying to understand if
this is a standard way of doing things...

> - close(fd)
>
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 38 ++++++++++++++++++++++++++++++--------
>  include/uapi/linux/rpmsg.h | 24 ++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 28f57945ccd9..9f2f118ceb7b 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -75,19 +75,32 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  				unsigned long arg)
>  {
>  	struct rpmsg_ctrldev *ctrldev = fp->private_data;
> +	struct rpmsg_endpoint_fd_info ept_fd_info;
>  	void __user *argp = (void __user *)arg;
>  	struct rpmsg_endpoint_info eptinfo;
>  	struct rpmsg_channel_info chinfo;
>  	struct rpmsg_device *rpdev;
>  	int ret = 0;
> -
> -	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> -		return -EFAULT;
> -
> -	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> -	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> -	chinfo.src = eptinfo.src;
> -	chinfo.dst = eptinfo.dst;
> +	int fd = -1;
> +
> +	if (cmd == RPMSG_CREATE_EPT_IOCTL || cmd == RPMSG_CREATE_DEV_IOCTL ||
> +	    cmd == RPMSG_RELEASE_DEV_IOCTL) {
> +		if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> +			return -EFAULT;
> +
> +		memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> +		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +		chinfo.src = eptinfo.src;
> +		chinfo.dst = eptinfo.dst;
> +	} else if (cmd == RPMSG_CREATE_EPT_FD_IOCTL) {


Maybe we can put this 'else if condition' in the first 'if' and treat other
conditions under 'else', as 'RPMSG_CREATE_EPT_FD_IOCTL' is the only
ioctl with a different struct type.

Thanks,
Beleswar

> +		if (copy_from_user(&ept_fd_info, argp, sizeof(ept_fd_info)))
> +			return -EFAULT;
> +
> +		memcpy(chinfo.name, ept_fd_info.name, RPMSG_NAME_SIZE);
> +		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +		chinfo.src = ept_fd_info.src;
> +		chinfo.dst = ept_fd_info.dst;
> +	}
>  
>  	mutex_lock(&ctrldev->ctrl_lock);
>  	switch (cmd) {
> @@ -110,6 +123,15 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  				chinfo.name, ret);
>  		break;
>  
> +	case RPMSG_CREATE_EPT_FD_IOCTL:
> +		ret = rpmsg_anonymous_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo,
> +						    ept_fd_info.flags, &fd);
> +		if (!ret) {
> +			ept_fd_info.fd = fd;
> +			ret = copy_to_user(argp, &ept_fd_info, sizeof(ept_fd_info));
> +		}
> +		break;
> +
>  	default:
>  		ret = -EINVAL;
>  	}
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index f0c8da2b185b..e7057bd23577 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -53,4 +53,28 @@ struct rpmsg_endpoint_info {
>   */
>  #define RPMSG_SET_INCOMING_FLOWCONTROL _IOR(0xb5, 0x6, int)
>  
> +/**
> + * struct rpmsg_endpoint_fd_info - endpoint & fd info representation
> + * @name: name of service
> + * @src: local address. To set to RPMSG_ADDR_ANY if not used.
> + * @dst: destination address. To set to RPMSG_ADDR_ANY if not used.
> + * @flags: file flags of endpoint device, valid flags:
> + *         O_RDONLY/O_WRONLY/O_RDWR
> + *         O_NONBLOCK
> + *         O_CLOEXEC
> + * @fd: fd returned from driver
> + */
> +struct rpmsg_endpoint_fd_info {
> +	char name[32];
> +	__u32 src;
> +	__u32 dst;
> +	__u32 flags;
> +	__s32 fd;
> +};
> +
> +/**
> + * Instantiate a new rmpsg endpoint which is represented by fd
> + */
> +#define RPMSG_CREATE_EPT_FD_IOCTL _IOWR(0xb5, 0x7, struct rpmsg_endpoint_fd_info)
> +
>  #endif
